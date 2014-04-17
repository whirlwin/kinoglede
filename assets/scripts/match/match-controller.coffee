App = angular.module 'kinoglede'

App.controller 'MatchController', ['$scope', 'UserService', 'Matches', ($scope, UserService, Matches) ->

  $scope.init = ->
    if $scope.data.isLoggedIn()
      console.log UserService
      $scope.data.matchingUsers = UserService.getUsers currentUserId: $scope.data.user.id

  $scope.showMoreMatches = ->
    $scope.data.matchingUsers && $scope.data.matchingUsers.$resolved && $scope.data.matchingUsers.length

  $scope.showNoMoreMatches = ->
    !$scope.showMoreMatches() && $scope.data.isLoggedIn()

  $scope.currentMatch = ->
    if $scope.data.matchingUsers
      $scope.data.matchingUsers[$scope.data.matchingUsers.length - 1]

  $scope.approveMatch = (matchingUserId) ->
    Matches.approveMatch matchingUserId: matchingUserId

  $scope.rejectMatch = (matchUserId) ->
    Matches.reject(matchUserId: matchUserId).$promise.then (data) ->
      console.log 'DATA: ' + data
      $scope.data.matchingUsers.pop()
]