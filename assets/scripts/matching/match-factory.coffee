angular.module('kinoglede').factory 'Matches', ['$resource', ($resource) ->

  $resource 'users/:currentUserId/matches/:matchUserId', {},
    reject:       method: 'DELETE', params: currentUserId: 'me', matchUserId: '@matchUserId'
    approveMatch: method: 'PUT',    params: userId: '@userId'
]