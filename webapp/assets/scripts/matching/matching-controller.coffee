App = angular.module 'kinoglede'

App.controller 'MatchingController', ['$scope', 'MatchingService', ($scope, MatchingService) ->

  $scope.init = ->
    if $scope.data.user.id
      $scope.data.matchingUsers = MatchingService.findMatchingUsers($scope.data.user.id)
]