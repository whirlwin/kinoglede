// Generated by CoffeeScript 1.7.1
(function() {
  angular.module('kinoglede').factory('Users', [
    '$resource', function($resource) {
      return $resource('users/:userId', {}, {
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

//# sourceMappingURL=user-factory.map
