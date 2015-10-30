'use strict'

angular.module 'etimesheetApp'
.controller 'EtimesheetsCtrl', ($scope, $meteor, $rootScope) ->
  $scope.viewName = 'Etimesheets'
  $scope.tables = []
  console.log($scope.tables)
  $scope.etimesheets=$scope.$meteorCollection () ->
   Etimesheets.find {}, {sort:$scope.getReactively('sort')} 
  console.log($scope.etimesheets)
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('etimesheets')

  $scope.projects = $scope.$meteorCollection Projects
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('projects')

  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {"profile.deleted":"0"}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $meteor.subscribe('users')

    $scope.set=(name)->
    $scope.pname=name
    console.log($scope.name)


  $scope.save = () ->
    $scope.newEtimesheet=$scope.tables
    $scope.etimesheets.save $scope.newEtimesheet
    console.log($scope.newEtimesheet)
    $scope.newEtimesheet = undefined
    $scope.tables = undefined
    console.log='success'
    

   $scope.set=(name)->
    $scope.pname=name

  $scope.addRow = () ->
    console.log($scope.tables)
    $scope.tables.push({pname:$scope.newEtimesheet.name,ptime:$scope.newEtimesheet.time,pdetails:$scope.newEtimesheet.details,user:$rootScope.currentUser._id,createdDate:new Date()})
    $scope.newEtimesheet=undefined

    
