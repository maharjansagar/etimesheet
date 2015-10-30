'use strict'

angular.module 'etimesheetApp'
.controller 'DesignationsListCtrl', ($scope, $meteor) ->
  $scope.designations = $scope.$meteorCollection () ->
    Designations.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('designations')

  $meteor.session 'designationsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.designations.save $scope.newDesignation
      $scope.newDesignation = undefined
      
  $scope.remove = (designation) ->
    $scope.designations.remove designation
