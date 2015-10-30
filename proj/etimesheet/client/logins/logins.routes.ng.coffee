'use strict'

angular.module 'etimesheetApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'logins',
    url: '/logins'
    templateUrl: 'client/logins/logins.view.html'
    controller: 'LoginsCtrl'
  .state 'logout',
  url: '/logout'
  resolve: 'logout': ['$meteor', '$state'
   ($meteor, $state) ->
    $meteor.logout().then (->
     $state.go 'main'
     return
    ), (err) ->
     console.log 'logout error - ', err
     return
   ]
