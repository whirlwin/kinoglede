angular.module('kinoglede').factory 'Matches', ['$resource', ($resource) ->

  $resource '/api/users/:currentUserId/matches/:matchUserId', {},

    reject: method: 'DELETE', params: (currentUserId: '@currentUserId', matchUserId: '@matchUserId')

    approveMatch: method: 'PUT', params: (userId:        '@userId')
]