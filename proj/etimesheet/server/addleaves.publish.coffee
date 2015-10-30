'use strict'

Meteor.publish 'addleaves', (options, searchString, od) ->
  where =
    'user':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  Addleaves.find where, options
