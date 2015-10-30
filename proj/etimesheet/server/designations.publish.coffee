'use strict'

Meteor.publish 'designations', (options, searchString) ->
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Designations.find where, options
