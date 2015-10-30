'use strict'

angular.module 'etimesheetApp'
.filter 'myFilter', ->
  (users, work) ->
    if !work
      return false
    _.filter users, (user) ->
      if _.contains(work.invited, user._id)
        false
      else
        true
