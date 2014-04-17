angular.module('kinoglede').factory 'Movies', ['$resource', ($resource) ->

  $resource 'movies/:movieId'
]