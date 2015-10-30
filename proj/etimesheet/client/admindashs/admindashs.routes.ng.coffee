'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'admindashs',
    url: '/admindashs'
    templateUrl: 'client/admindashs/admindashs.view.html'
    controller: 'AdmindashsCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]