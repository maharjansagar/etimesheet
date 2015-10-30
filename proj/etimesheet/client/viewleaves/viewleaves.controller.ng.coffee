'use strict'

angular.module 'etimesheetApp'
.controller 'ViewleavesCtrl', ($scope, $meteor) ->
  $scope.viewName = 'Viewleaves'

  $scope.addleaves = $scope.$meteorCollection () ->
    Addleaves.find {}, {sort:$scope.getReactively('sort')} 
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('addleaves')
