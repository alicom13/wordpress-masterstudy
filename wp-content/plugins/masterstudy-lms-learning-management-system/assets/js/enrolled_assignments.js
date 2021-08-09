"use strict";

(function ($) {
  var myVar;
  $(document).ready(function () {
    (function ($) {
      var myVar;
      $(document).ready(function () {
        $('body').addClass('enrolled-assignments');
        new Vue({
          el: '#stm_lms_enrolled_assignments',
          data: function data() {
            return {
              loading: false,
              assignments: window['stm_lms_enrolled_assignments']['assignments'],
              s: '',
              active_sort: false,
              statuses: window['stm_lms_enrolled_assignments']['statuses'],
              active_status: false,
              page: 1
            };
          },
          mounted: function mounted() {},
          methods: {
            getAssignments: function getAssignments() {
              var vm = this;
              if (vm.loading) return false;
              var url = stm_lms_ajaxurl + '?action=stm_lms_get_enrolled_assignments&nonce=' + stm_lms_nonces['stm_lms_get_enrolled_assingments'] + '&page=' + vm.page + '&status=' + vm.active_status.id + '&s=' + vm.s;
              vm.$set(vm, 'loading', true);
              this.$http.get(url).then(function (response) {
                response = response.body;
                vm.$set(vm, 'assignments', response);
                vm.$set(vm, 'loading', false);
                console.log(response);
              });
            },
            initSearch: function initSearch() {
              var vm = this;
              clearTimeout(myVar);
              myVar = setTimeout(function () {
                vm.$set(vm, 'page', 1);
                vm.getAssignments();
              }, 1000);
            }
          }
        });
      });
    })(jQuery);
  });
})(jQuery);