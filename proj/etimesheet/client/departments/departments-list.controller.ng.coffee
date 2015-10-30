'use strict'

angular.module 'etimesheetApp'
.controller 'DepartmentsListCtrl', ($scope, $meteor) ->
  $scope.departments = $scope.$meteorCollection () ->
    Departments.find {'deleted':0}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('departments')

  $meteor.session 'departmentsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    $scope.newDepartment.deleted=0
    $scope.newDepartment.member=$scope.member
    $scope.departments.save $scope.newDepartment
    $scope.newDepartment = undefined

  $scope.remove = (departmentId) ->
    Meteor.call('departmentDelete',departmentId)
      
  
