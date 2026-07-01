(function () {
    function initHomeSearchTabs(root) {
        const tabs = root.querySelectorAll('.search-tab');
        const forms = root.querySelectorAll('.search-form');

        tabs.forEach(function (tab) {
            if (tab.dataset.homeSearchTabBound === '1') {
                return;
            }
            tab.dataset.homeSearchTabBound = '1';

            tab.addEventListener('click', function () {
                tabs.forEach(function (t) {
                    t.classList.remove('home-search__tab--active');
                });
                tab.classList.add('home-search__tab--active');

                forms.forEach(function (form) {
                    form.classList.add('hidden');
                });

                const target = document.getElementById(tab.dataset.tab + '-form');
                if (target) {
                    target.classList.remove('hidden');
                }
            });
        });
    }

    function initHomeSearchSelect2(root) {
        if (typeof window.jQuery === 'undefined' || !window.jQuery.fn.select2) {
            return;
        }

        const $ = window.jQuery;
        const placeholders = {
            departure_city: 'Select an option',
            arrival_city: 'Select an option',
            bus_class: 'Any',
            bus_departure_date: 'Select Bus Company',
            rt_departure_city: 'Select an option',
            rt_arrival_city: 'Select an option',
            rt_bus_class: 'Any',
        };

        root.querySelectorAll('select.home-search__input').forEach(function (el) {
            const $el = $(el);
            if ($el.data('select2')) {
                return;
            }

            const id = el.id;
            $el.select2({
                placeholder: placeholders[id] || 'Select an option',
                allowClear: id !== 'bus_class' && id !== 'rt_bus_class',
                width: '100%',
                dropdownParent: $(root),
            });
        });
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

        initHomeSearchSelect2(root);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initHomeSearch);
    } else {
        initHomeSearch();
    }
})();
