document.addEventListener('DOMContentLoaded', function () {
    const accountLinks = document.getElementById('customer-account-links');
    if (!accountLinks) {
        return;
    }

    const activeLink = accountLinks.querySelector('.customer-account-nav__link--active');
    if (activeLink) {
        requestAnimationFrame(function () {
            activeLink.scrollIntoView({ inline: 'center', block: 'nearest' });
        });
    }

    const mobileMenu = document.getElementById('mobile-menu');
    const mobileMenuBtn = document.getElementById('mobile-menu-btn');
    const siteHeader = document.querySelector('.customer-site-header');

    if (mobileMenu && mobileMenuBtn && siteHeader) {
        const observer = new MutationObserver(function () {
            siteHeader.classList.toggle('customer-site-header--menu-open', mobileMenu.classList.contains('is-open'));
        });

        observer.observe(mobileMenu, { attributes: true, attributeFilter: ['class'] });
    }
});
