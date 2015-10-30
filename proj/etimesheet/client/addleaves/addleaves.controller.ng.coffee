'use strict'

angular.module 'etimesheetApp'
.controller 'AddleavesCtrl', ($scope, $meteor, $state) ->
  $scope.viewName = 'Addleaves'

  $scope.addleaves = $scope.$meteorCollection () ->
    Addleaves.find {}, {sort:$scope.getReactively('sort')} 

  $scope.save = () ->
    $scope.newAddleave.user= $scope.currentUser.emails[0].address
    $scope.addleaves.save $scope.newAddleave
    $scope.newAddleave
    $state.go 'userdashs'