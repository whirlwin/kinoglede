angular.module('kinoglede').service 'MatchingService', ['$resource', ($resource) ->

  findMatchingUsers: (userId) -> $resource('/api/users/matches').query()
]