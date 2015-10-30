'use strict'

Meteor.publish 'etimesheets', (options, od, searchString) ->
  where =
    'pname':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Etimesheets.find where, options
