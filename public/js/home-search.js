(function () {
    function showSearchForm(form) {
        if (!form) {
            return;
        }
        form.classList.remove('hidden');
        form.removeAttribute('hidden');
        form.style.display = '';
        form.setAttribute('aria-hidden', 'false');
    }

    function hideSearchForm(form) {
        if (!form) {
            return;
        }
        form.classList.add('hidden');
        form.setAttribute('hidden', 'hidden');
        form.style.display = 'none';
        form.setAttribute('aria-hidden', 'true');
    }

    function initHomeSearchTabs(root) {
        const tabs = root.querySelectorAll('.search-tab');
        const forms = root.querySelectorAll('.search-form');

        tabs.forEach(function (tab) {
            if (tab.dataset.homeSearchTabBound === '1') {
                return;
            }
            tab.dataset.homeSearchTabBound = '1';

            tab.addEventListener('click', function (event) {
                event.preventDefault();

                tabs.forEach(function (t) {
                    t.classList.remove('home-search__tab--active');
                    t.setAttribute('aria-selected', 'false');
                });
                tab.classList.add('home-search__tab--active');
                tab.setAttribute('aria-selected', 'true');

                forms.forEach(hideSearchForm);

                const formId = tab.dataset.tab + '-form';
                const target = root.querySelector('#' + formId);
                showSearchForm(target);
            });
        });

        const activeTab = root.querySelector('.home-search__tab--active') || tabs[0];
        if (activeTab) {
            forms.forEach(hideSearchForm);
            const activeForm = root.querySelector('#' + activeTab.dataset.tab + '-form');
            showSearchForm(activeForm);
        }
    }

    function initHomeSearch() {
        const root = document.getElementById('search');
        if (!root || root.dataset.homeSearchBound === '1') {
            return;
        }
        root.dataset.homeSearchBound = '1';

        initHomeSearchTabs(root);

        const today = new Date().toISOString().split('T')[0];
        root.querySelectorAll('input[type="date"]').forEach(function (input) {
            input.setAttribute('min', today);
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initHomeSearch);
    } else {
        initHomeSearch();
    }
})();
