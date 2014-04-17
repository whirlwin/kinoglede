angular.module('kinoglede').factory 'Matches', ['$resource', ($resource) ->

  $resource 'users/me/matches/:matchUserId', {},
    reject:       method: 'DELETE', params: matchUserId: '@matchUserId'
    approveMatch: method: 'POST',   params: matchUserId: '@matchUserId'
]