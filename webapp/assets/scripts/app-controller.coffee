angular.module('kinoglede').controller 'AppController', ['$scope', 'UserService', ($scope, UserService) ->

  $scope.init = ->
    $scope.data = {}
    $scope.data.user = UserService.getUser()
]