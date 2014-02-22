mongoose = require 'mongoose'

locationSchema = null

class Location
  locationSchema = new mongoose.Schema
    name: type: String
    locationId: String

module.exports = mongoose.model 'Location', locationSchema