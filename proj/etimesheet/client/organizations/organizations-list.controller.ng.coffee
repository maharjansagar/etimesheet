'use strict'

angular.module 'etimesheetApp'
.controller 'OrganizationsListCtrl', ($scope, $meteor) ->
  $scope.organizations = $scope.$meteorCollection () ->
    Organizations.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('organizations')

  $meteor.session 'organizationsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.organizations.save $scope.newOrganization
      $scope.newOrganization = undefined
      
  $scope.remove = (organization) ->
    $scope.organizations.remove organization
