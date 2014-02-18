angular.module('kinoglede').controller 'AppController', ['$scope', 'UserService', ($scope, UserService) ->

  $scope.data = {}
  $scope.data.user = UserService.getUser()
]