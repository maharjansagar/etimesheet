angular.module 'etimesheetApp', [
  'angular-meteor'
  'ui.router'
  'ngMaterial'
]

onReady = () ->
  angular.bootstrap document, ['etimesheetApp']
  
if Meteor.isCordova
  angular.element(document).on 'deviceready', onReady
else
  angular.element(document).ready onReady