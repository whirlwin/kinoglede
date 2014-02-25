angular.module('kinoglede').factory 'Users', ['$resource', ($resource) ->

  ###
  findMatchingUsers: (userId) ->
    matchingUsers = $resource('/api/users').query()

  approveMatch: (userId) ->
    $resource('/api/users/me/matches', null, update: method: 'PUT').update()

  ###

  $resource '/api/users/:userId', {},
    query:        method: 'GET', isArray: true
    approveMatch: method: 'PUT', params: userId: '@userId'
]