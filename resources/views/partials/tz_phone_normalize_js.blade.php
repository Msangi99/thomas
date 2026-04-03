function normalizePhoneTo255(str) {
    if (!str) return '';
    var trimmed = String(str).trim();
    if (!trimmed) return '';
    var digits = trimmed.replace(/\D/g, '');
    while (digits.indexOf('00') === 0 && digits.length > 2) {
        digits = digits.substring(2);
    }
    if (digits.length === 12 && digits.substring(0, 3) === '225') {
        var r = digits.substring(3);
        if (r.charAt(0) === '6' || r.charAt(0) === '7') {
            digits = '255' + r;
        }
    }
    if (digits.length === 12 && digits.substring(0, 3) === '255') {
        return digits;
    }
    if (digits.length === 10 && digits.charAt(0) === '0') {
        return '255' + digits.substring(1);
    }
    if (digits.length === 9 && (digits.charAt(0) === '6' || digits.charAt(0) === '7')) {
        return '255' + digits;
    }
    if (digits.charAt(0) === '0') {
        return '255' + digits.substring(1);
    }
    if (digits.substring(0, 3) !== '255') {
        return '255' + digits;
    }
    return digits;
}
