angular.module('kinoglede').service 'UserService', ['$resource', ($resource) ->

  getUser: -> $resource('/users/me').get()

  getUsers: -> $resource('/users')

  signOutUser: -> $resource('/users/me/session').delete()

]