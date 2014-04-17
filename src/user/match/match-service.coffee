matchRepository = require './match-repository'

class MatchService

  addMatchToUsers: (userId, gender) ->
    matchRepository.addMatchToUsers userId, gender

  addMatchesToUser: (userId, gender) ->
    matchRepository.addMatchesToUser userId, gender

  rejectMatch: (userId, matchUserId) ->
    matchRepository.deleteMatch userId, matchUserId

module.exports = new MatchService()