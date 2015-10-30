'use strict'

angular.module 'etimesheetApp'
.controller 'UsermanagesListCtrl', ($scope, $meteor) ->
  
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":"0"}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')
  $scope.email = ''

  $scope.remove = (user) ->
    Meteor.call('remove', user)