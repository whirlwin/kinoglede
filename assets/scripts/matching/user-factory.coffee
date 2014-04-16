angular.module('kinoglede').factory 'Users', ['$resource', ($resource) ->

  $resource 'users/:userId', {},
    query:        method: 'GET', isArray: true
    approveMatch: method: 'PUT', params: userId: '@userId'
]