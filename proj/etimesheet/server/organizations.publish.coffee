'use strict'

Meteor.publish 'organizations', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Organizations.find where, options