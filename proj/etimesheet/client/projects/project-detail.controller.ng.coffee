'use strict'

angular.module 'etimesheetApp'
.controller 'ProjectDetailCtrl', ($scope, $stateParams, $meteor, $state) ->
  $scope.project = $scope.$meteorObject Projects, $stateParams.projectId
  $scope.$meteorSubscribe('projects')
  # $scope.user = $scope.$meteorCollection () ->
  #   Meteor.users.find {'_id':$stateParams.usermanageId}
  # $scope.fname=$scope.user[0].profile[0].fname
  # $scope.email=$scope.user[0].emails[0].address
  
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')

  $scope.save = () ->
    if $scope.form.$valid
      $scope.project.save().then(
        (numberOfDocs) ->
          # Meteor.call('update',$stateParams.usermanageId,$scope.email,$scope.fname)
          console.log 'save successful, docs affected ', numberOfDocs
          $state.go 'projects-list'
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.project.reset()
