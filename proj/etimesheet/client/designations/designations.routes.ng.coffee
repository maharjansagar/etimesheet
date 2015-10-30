'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'designations-list',
    url: '/designations'
    templateUrl: 'client/designations/designations-list.view.html'
    controller: 'DesignationsListCtrl'
  .state 'designation-detail',
    url: '/designations/:designationId'
    templateUrl: 'client/designations/designation-detail.view.html'
    controller: 'DesignationDetailCtrl'
