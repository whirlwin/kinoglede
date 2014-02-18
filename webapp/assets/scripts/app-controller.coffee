angular.module('kinoglede').controller 'AppController', ['$scope', 'UserService', ($scope, UserService) ->

  $scope.user = UserService.getUser()
]