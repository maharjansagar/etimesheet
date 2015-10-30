'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'viewleaves',
    url: '/viewleaves'
    templateUrl: 'client/viewleaves/viewleaves.view.html'
    controller: 'ViewleavesCtrl'
