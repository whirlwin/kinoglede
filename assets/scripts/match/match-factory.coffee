angular.module('kinoglede').factory 'Matches', ['$resource', ($resource) ->

  $resource 'users/me/matches/:matchUserId', {},
    findMatchingUsers: method: 'GET',    isArray: true
    reject:            method: 'DELETE', params: matchUserId: '@matchUserId'
    approveMatch:      method: 'POST',   params: matchUserId: '@matchUserId'
]