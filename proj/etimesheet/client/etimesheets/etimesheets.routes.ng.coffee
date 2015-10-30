'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'etimesheets',
    url: '/etimesheets'
    templateUrl: 'client/etimesheets/etimesheets.view.html'
    controller: 'EtimesheetsCtrl'
