q        = require 'q'
Location = require './location'

class LocationRepository

  findLocation: (criteria) ->
    deferred = q.defer()
    Location.findOne criteria, (err, location) ->
      if err
        deferred.reject err
      else
        deferred.resolve location
    deferred.promise

  saveLocation: (location) ->
    deferred = q.defer()
    location.save (err, location) ->
      if err
        deferred.reject err
      else
        deferred.resolve location
    deferred.promise

module.exports = LocationRepository