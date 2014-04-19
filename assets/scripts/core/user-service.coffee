angular.module('kinoglede').service 'UserService', ['$resource', ($resource) ->

  getUser: -> $resource('/users/me').get()

  getMatchingUsers: -> $resource('/users').query()

  signOutUser: -> $resource('/users/me/session').delete()
]