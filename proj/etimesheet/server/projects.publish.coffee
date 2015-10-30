'use strict'

Meteor.publish 'projects', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Projects.find where, options


