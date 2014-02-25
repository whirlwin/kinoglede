angular.module('kinoglede').controller 'AppController', ['$scope', 'UserService', ($scope, UserService) ->

  $scope.data = {}

  $scope.init = ->
    $scope.data.user = UserService.getUser()

  $scope.data.isLoggedIn = ->
    !!$scope.data.user.id
]