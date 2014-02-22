q = require 'q'

class LocationRepository

  saveLocation: (location) ->
    deferred = q.defer()

    location.save (err, location) ->
      if err
        console.log 'err:' + err
        deferred.reject err
      else
        deferred.resolve location

    deferred.promise

module.exports = LocationRepository