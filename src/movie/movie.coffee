mongoose = require 'mongoose'

movieSchema = null

class Movie
  movieSchema = new mongoose.Schema
    title:    type: String, required: true
    imageUrl: type: String, required: true, unique: true

module.exports = mongoose.model 'Movie', movieSchema