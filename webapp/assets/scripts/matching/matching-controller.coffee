App = angular.module 'kinoglede'

App.controller 'MatchingController', ['$scope', 'Users', ($scope, Users) ->

  $scope.init = ->
    if $scope.data.isLoggedIn()
      $scope.data.matchingUsers = Users.query currentUserId: $scope.data.user.id

  $scope.showMoreMatches = ->
    $scope.data.matchingUsers && $scope.data.matchingUsers.$resolved && $scope.data.matchingUsers.length

  $scope.showNoMoreMatches = ->
    !$scope.showMoreMatches() && $scope.data.isLoggedIn()

  $scope.currentMatch = ->
    if $scope.data.matchingUsers
      $scope.data.matchingUsers[$scope.data.matchingUsers.length - 1]

  $scope.approveMatch = (matchingUserId) ->
    Users.approveMatch userId: $scope.data.user.id, matchingUserId: matchingUserId

  $scope.rejectMatch = ->
    $scope.data.matchingUsers.pop()
]