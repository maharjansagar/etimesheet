'use strict'

angular.module 'etimesheetApp'
.controller 'ProjectsListCtrl', ($scope, $meteor, $state) ->
  $scope.member=[]

  $scope.projects = $scope.$meteorCollection () ->
    Projects.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('projects')

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":"0"}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')
    

  # $meteor.session 'projectsCounter'
  # .bind $scope, 'page'

  $scope.shouldBeDisabled= (users)->
    if(users== '1')
      return true
    else
      return false

  $scope.exist = (users, list) ->
    return list.indexOf(users) > -1

  $scope.toggle = (users, list) ->
    $scope.indexes = list.indexOf(users)
    if($scope.indexes > -1)
      list.splice($scope.indexes, 1)
    else
      list.push(users)
    
  $scope.save = () ->
    $scope.newProject.deleted=0
    $scope.newProject.active=1
    $scope.newProject.member=$scope.member
    $scope.projects.save $scope.newProject
    $scope.newProject = undefined
    document.getElementById("form").reset()
    $scope.member=[]
    $scope.idx=0 
      
  $scope.remove = (project) ->
    $scope.projects.remove project
