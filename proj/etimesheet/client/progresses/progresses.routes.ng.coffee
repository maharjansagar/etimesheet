'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'progresses',
    url: '/progresses'
    templateUrl: 'client/progresses/progresses.view.html'
    controller: 'ProgressesCtrl'
