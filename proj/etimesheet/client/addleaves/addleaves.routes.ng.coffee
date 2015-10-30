'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'addleaves',
    url: '/addleaves'
    templateUrl: 'client/addleaves/addleaves.view.html'
    controller: 'AddleavesCtrl'
