angular.module('kinoglede').filter 'unique', ->
  (collection, keyName) ->
    output = []
    keys   = []
    angular.forEach collection, (item) ->
      key = item[keyName]
      if keys.indexOf(key) == -1
        keys.push key
        output.push item
    output