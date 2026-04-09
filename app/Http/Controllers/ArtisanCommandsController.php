<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\File;
use Symfony\Component\Console\Output\BufferedOutput;

class ArtisanCommandsController extends Controller
{
    /**
     * Whitelisted artisan actions (name => [command, default options]).
     * Options are merged with request-safe extras in run().
     *
     * @var array<string, array{0: string, 1: array<string, mixed>}>
     */
    private const ALLOWED = [
        'config_cache' => ['config:cache', []],
        'config_clear' => ['config:clear', []],
        'route_cache' => ['route:cache', []],
        'route_clear' => ['route:clear', []],
        'view_cache' => ['view:cache', []],
        'view_clear' => ['view:clear', []],
        'cache_clear' => ['cache:clear', []],
        'event_cache' => ['event:cache', []],
        'event_clear' => ['event:clear', []],
        'optimize' => ['optimize', []],
        'optimize_clear' => ['optimize:clear', []],
        'migrate_status' => ['migrate:status', ['--no-ansi' => true]],
        'migrate_all' => ['migrate', ['--force' => true]],
    ];

    public function index()
    {
        $migrationFiles = collect(File::files(database_path('migrations')))
            ->map(fn (\SplFileInfo $f) => $f->getFilename())
            ->filter(fn (string $name) => str_ends_with($name, '.php'))
            ->sort()
            ->values()
            ->all();

        $statusOutput = $this->callArtisan('migrate:status', ['--no-ansi' => true]);

        return view('system.commands', [
            'migrationFiles' => $migrationFiles,
            'migrateStatusOutput' => $statusOutput['output'],
            'migrateStatusExit' => $statusOutput['exit_code'],
        ]);
    }

    public function run(Request $request)
    {
        $request->validate([
            'action' => ['required', 'string', 'in:'.implode(',', array_merge(array_keys(self::ALLOWED), ['migrate_file']))],
            'migration' => ['nullable', 'string', 'max:255'],
        ]);

        $action = $request->input('action');

        if ($action === 'migrate_file') {
            $filename = $request->input('migration', '');
            $filename = preg_replace('/^migration--/i', '', $filename);
            if (!is_string($filename) || !preg_match('/^[a-z0-9_]+\.php$/i', $filename)) {
                return $this->respond($request, false, 1, 'Invalid migration filename.');
            }
            $fullPath = database_path('migrations/'.$filename);
            if (!is_file($fullPath)) {
                return $this->respond($request, false, 1, 'Migration file not found: '.$filename);
            }
            $result = $this->callArtisan('migrate', [
                '--force' => true,
                '--path' => 'database/migrations/'.$filename,
            ]);

            return $this->respond($request, $result['exit_code'] === 0, $result['exit_code'], $result['output']);
        }

        [$command, $options] = self::ALLOWED[$action];
        $result = $this->callArtisan($command, $options);

        return $this->respond($request, $result['exit_code'] === 0, $result['exit_code'], $result['output']);
    }

    /**
     * @param  array<string, mixed>  $params
     * @return array{exit_code: int, output: string}
     */
    private function callArtisan(string $command, array $params): array
    {
        $buffer = new BufferedOutput;
        $exitCode = Artisan::call($command, $params, $buffer);
        $output = trim($buffer->fetch());

        return [
            'exit_code' => $exitCode,
            'output' => $output !== '' ? $output : trim(Artisan::output()),
        ];
    }

    private function respond(Request $request, bool $success, int $exitCode, string $output)
    {
        if ($request->wantsJson()) {
            return response()->json([
                'success' => $success,
                'exit_code' => $exitCode,
                'output' => $output,
            ], $success ? 200 : 422);
        }

        return redirect()
            ->route('system.commands')
            ->with($success ? 'command_ok' : 'command_err', [
                'exit_code' => $exitCode,
                'output' => $output,
            ]);
    }
}
