'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'userdashs',
    url: '/userdashs'
    templateUrl: 'client/userdashs/userdashs.view.html'
    controller: 'UserdashsCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
