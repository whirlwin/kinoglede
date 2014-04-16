// Generated by CoffeeScript 1.7.1
(function() {
  var PassportConfig, env, passport, passportFacebook, userService;

  passport = require('passport');

  passportFacebook = require('passport-facebook');

  env = require('../env');

  userService = require('../src/user/user-service');

  PassportConfig = (function() {
    var FacebookStrategy, getSessionUser;

    function PassportConfig() {}

    FacebookStrategy = passportFacebook.Strategy;

    PassportConfig.prototype.configure = function(app) {
      var configureConversion, configureFacebookStrategy, initialize;
      (initialize = function() {
        app.use(passport.initialize());
        return app.use(passport.session());
      })();
      (configureConversion = function() {
        passport.serializeUser(function(user, done) {
          return done(null, user);
        });
        return passport.deserializeUser(function(obj, done) {
          return done(null, obj);
        });
      })();
      return (configureFacebookStrategy = function() {
        return passport.use(new FacebookStrategy({
          clientID: env.facebook.clientID,
          clientSecret: env.facebook.clientSecret,
          profileFields: ['displayName', 'name', 'gender', 'location', 'photos'],
          callbackURL: 'http://localhost:3000/auth/facebook/callback'
        }, function(accessToken, refreshToken, profile, done) {
          return userService.findOrSaveUser(profile).then(function(mongoUser) {
            return done(null, getSessionUser(mongoUser));
          })["catch"](function(err) {
            return done(err);
          });
        }));
      })();
    };

    getSessionUser = function(mongoUser) {
      var mutableUser;
      mutableUser = mongoUser.toObject();
      mutableUser.id = mutableUser._id;
      return mutableUser;
    };

    return PassportConfig;

  })();

  module.exports = PassportConfig;

}).call(this);

//# sourceMappingURL=passport-config.map
