// Generated by CoffeeScript 1.7.1
(function() {
  var User, UserRepository, q;

  q = require('q');

  User = require('./user');

  UserRepository = (function() {
    function UserRepository() {}

    UserRepository.prototype.findUser = function(criteria) {
      var deferred;
      deferred = q.defer();
      User.findOne(criteria, function(err, user) {
        if (err) {
          console.error(err);
          return deferred.reject(err);
        } else {
          return deferred.resolve(user);
        }
      });
      return deferred.promise;
    };

    UserRepository.prototype.findUsers = function(criteria) {
      var deferred;
      deferred = q.defer();
      User.find(criteria, function(err, users) {
        if (err) {
          console.error(err);
          return deferred.reject(err);
        } else {
          return deferred.resolve(users);
        }
      });
      return deferred.promise;
    };

    UserRepository.prototype.saveUser = function(user) {
      var deferred;
      deferred = q.defer();
      user.save(function(err, user) {
        if (err) {
          console.error(err);
          return deferred.reject(err);
        } else {
          return deferred.resolve(user);
        }
      });
      return deferred.promise;
    };

    UserRepository.prototype.addMatchToUsers = function(userId, gender) {
      var deferred;
      deferred = q.defer();
      User.update({
        _id: {
          $ne: userId
        },
        gender: gender
      }, {
        $push: {
          matchingUserIds: userId
        }
      }, function(err, numUpdatedUsers) {
        if (err) {
          console.error(err);
          return deferred.reject(err);
        } else {
          return deferred.resolve(numUpdatedUsers);
        }
      });
      return deferred.promise;
    };

    UserRepository.prototype.addMatchesToUser = function(userId, gender) {
      var deferred;
      deferred = q.defer();
      User.find({
        _id: {
          $ne: userId
        },
        gender: gender
      }, function(err, users) {
        var userIds;
        if (err) {
          console.error(err);
          return deferred.reject(err);
        } else {
          userIds = users.map(function(user) {
            return user.id;
          });
          return User.update({
            _id: userId
          }, {
            $pushAll: {
              matchingUserIds: userIds
            }
          }, function(err, numUpdatedUsers) {
            if (err) {
              console.error(err);
              return deferred.reject(err);
            } else {
              return deferred.resolve(numUpdatedUsers);
            }
          });
        }
      });
      return deferred.promise;
    };

    UserRepository.prototype.deleteMatch = function(userId, matchUserId) {
      var deferred;
      return deferred = q.defer();

      /*
      User.update (_id: userId), ($pull: (matchingUserIds._id: matchUserId)), (err, val) ->
        if err
          console.error err
          referred.reject err
        else
          deferred.resolve
      
      deferred.promise
       */
    };

    return UserRepository;

  })();

  module.exports = UserRepository;

}).call(this);

//# sourceMappingURL=user-repository.map
