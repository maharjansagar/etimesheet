'use strict'

angular.module 'etimesheetApp'
.controller 'ProgressesCtrl', ($scope, $meteor) ->
  $scope.viewName = 'Progresses'

  # $scope.projects = $scope.$meteorCollection () ->
  #   Projects.find {}, {sort:$scope.getReactively('sort')}
  # $meteor.autorun $scope, () ->
  #   $scope.$meteorSubscribe('projects')
      
  $scope.etimesheets=$scope.$meteorCollection () ->
   Etimesheets.find {}, {sort:$scope.getReactively('sort')} 
  console.log($scope.etimesheets)
  console.log($scope.etimesheets)
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('etimesheets')
