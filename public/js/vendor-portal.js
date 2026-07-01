document.addEventListener('DOMContentLoaded', function () {
    const sidebar = document.getElementById('vendor-sidebar');
    const overlay = document.getElementById('vendor-sidebar-overlay');
    const toggleBtn = document.getElementById('vendor-sidebar-toggle');

    function openSidebar() {
        if (!sidebar) return;
        sidebar.classList.add('vendor-sidebar--open');
        overlay?.classList.add('vendor-sidebar-overlay--visible');
        toggleBtn?.setAttribute('aria-expanded', 'true');
        document.body.classList.add('vendor-sidebar-open');
    }

    function closeSidebar() {
        if (!sidebar) return;
        sidebar.classList.remove('vendor-sidebar--open');
        overlay?.classList.remove('vendor-sidebar-overlay--visible');
        toggleBtn?.setAttribute('aria-expanded', 'false');
        document.body.classList.remove('vendor-sidebar-open');
    }

    toggleBtn?.addEventListener('click', function () {
        if (sidebar?.classList.contains('vendor-sidebar--open')) {
            closeSidebar();
        } else {
            openSidebar();
        }
    });

    overlay?.addEventListener('click', closeSidebar);

    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') {
            closeSidebar();
        }
    });

    window.addEventListener('resize', function () {
        if (window.innerWidth >= 1024) {
            closeSidebar();
        }
    });

    document.querySelectorAll('[data-vendor-submenu-toggle]').forEach(function (btn) {
        const targetId = btn.getAttribute('data-vendor-submenu-toggle');
        const submenu = document.getElementById(targetId);
        if (!submenu) return;

        btn.addEventListener('click', function () {
            const expanded = btn.getAttribute('aria-expanded') === 'true';
            btn.setAttribute('aria-expanded', expanded ? 'false' : 'true');
            submenu.classList.toggle('hidden');
            btn.classList.toggle('vendor-sidebar__link--expanded', !expanded);
        });
    });
});
