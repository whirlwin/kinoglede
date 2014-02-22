mongoose = require 'mongoose'

locationSchema = null

class Location
  locationSchema = new mongoose.Schema
    fbLocationId: type: String, required: true, unique: true
    name:         type: String, required: true

module.exports = mongoose.model 'Location', locationSchema