angular.module('kinoglede').service 'UserService', ['$resource', ($resource) ->

  getUser: -> $resource('/users/me').get()
]