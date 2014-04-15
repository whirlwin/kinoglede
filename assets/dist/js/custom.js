(function() {
  var App;

  App = angular.module('kinoglede', ['ngRoute', 'ngResource']);

  App.config([
    '$locationProvider', '$routeProvider', function($locationProvider, $routeProvider) {
      $locationProvider.html5Mode(true);
      return $routeProvider.when('/', {
        templateUrl: '/partials/index'
      }).when('/_=_', {
        redirectTo: '/'
      }).when('/innlogging', {
        templateUrl: '/partials/login'
      }).when('/min-profil', {
        templateUrl: '/partials/profile'
      }).when('/matching', {
        templateUrl: '/partials/matching'
      }).otherwise({
        templateUrl: '/partials/404'
      });
    }
  ]);

}).call(this);

(function() {
  angular.module('kinoglede').controller('AppController', [
    '$scope', 'UserService', function($scope, UserService) {
      $scope.data = {};
      $scope.init = function() {
        return $scope.data.user = UserService.getUser();
      };
      return $scope.data.isLoggedIn = function() {
        return !!$scope.data.user.id;
      };
    }
  ]);

}).call(this);

(function() {
  angular.module('kinoglede').service('UserService', [
    '$resource', function($resource) {
      return {
        getUser: function() {
          return $resource('/users/me').get();
        },
        signOutUser: function() {
          return $resource('/users/me/session')["delete"]();
        }
      };
    }
  ]);

}).call(this);

(function() {
  angular.module('kinoglede').factory('Matches', [
    '$resource', function($resource) {
      return $resource('/api/users/:currentUserId/matches/:matchUserId', {}, {
        reject: {
          method: 'DELETE',
          params: {
            currentUserId: '@currentUserId',
            matchUserId: '@matchUserId'
          }
        },
        approveMatch: {
          method: 'PUT',
          params: {
            userId: '@userId'
          }
        }
      });
    }
  ]);

}).call(this);

(function() {
  var App;

  App = angular.module('kinoglede');

  App.controller('MatchingController', [
    '$scope', 'Users', 'Matches', function($scope, Users, Matches) {
      $scope.init = function() {
        if ($scope.data.isLoggedIn()) {
          return $scope.data.matchingUsers = Users.query({
            currentUserId: $scope.data.user.id
          });
        }
      };
      $scope.showMoreMatches = function() {
        return $scope.data.matchingUsers && $scope.data.matchingUsers.$resolved && $scope.data.matchingUsers.length;
      };
      $scope.showNoMoreMatches = function() {
        return !$scope.showMoreMatches() && $scope.data.isLoggedIn();
      };
      $scope.currentMatch = function() {
        if ($scope.data.matchingUsers) {
          return $scope.data.matchingUsers[$scope.data.matchingUsers.length - 1];
        }
      };
      $scope.approveMatch = function(matchingUserId) {
        return Users.approveMatch({
          userId: $scope.data.user.id,
          matchingUserId: matchingUserId
        });
      };
      return $scope.rejectMatch = function(matchUserId) {
        console.log(matchUserId);
        return Matches.reject({
          currentUserId: $scope.data.user.id,
          matchUserId: matchUserId
        }).$promise.then(function(data) {
          console.log('DATA: ' + data);
          return $scope.data.matchingUsers.pop();
        });
      };
    }
  ]);

}).call(this);

(function() {
  angular.module('kinoglede').factory('Users', [
    '$resource', function($resource) {
      return $resource('/api/users/:userId', {}, {
        query: {
          method: 'GET',
          isArray: true
        },
        approveMatch: {
          method: 'PUT',
          params: {
            userId: '@userId'
          }
        }
      });
    }
  ]);

}).call(this);
