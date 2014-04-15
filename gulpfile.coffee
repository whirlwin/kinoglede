gulp          = require 'gulp'
gulpCoffee    = require 'gulp-coffee'
gulpConcat    = require 'gulp-concat'
gulpIf        = require 'gulp-if'
gulpJade      = require 'gulp-jade'
gulpMinifyCss = require 'gulp-minify-css'
gulpStylus    = require 'gulp-stylus'
gulpUglify    = require 'gulp-uglify'
env           = require './env'

ASSETS_PATH        = 'assets/'
CUSTOM_COFFEE_PATH = ASSETS_PATH + 'scripts/**/*.coffee'
CUSTOM_STYLUS_PATH = ASSETS_PATH + 'styles/**/*.styl'
CUSTOM_JADE_PATH   = ASSETS_PATH + 'views/**/*.jade'

JS_LIBS =
  "angular":       main: "angular.js",       min: "angular.min.js"
  "angular-route": main: "angular-route.js", min: "angular-route.min.js"
  "jquery":        main: "jquery.js",        min: "jquery.min.js"
  "bootstrap":     main: "js/bootstrap.js",  min: "js/bootstrap.min.js"

CSS_LIBS =
  "bootstrap": main: "css/bootstrap.css", min: "css/bootstrap.min.css"

getLibPaths = (libs) ->
  Object.keys(libs).map (libName) ->
    ASSETS_PATH + 'libs/' + libName + '/' + (if env.compressed then libs[libName].min else libs[libName].main)

gulp.task 'customCoffee', ->
  gulp.src(CUSTOM_COFFEE_PATH)
    .pipe(gulpCoffee())
    .pipe(gulpIf(env.compressed, gulpUglify()))
    .pipe(gulpConcat('custom.js'))
    .pipe(gulp.dest(ASSETS_PATH + 'dist/js/'))

gulp.task 'libJs', ->
  gulp.src(getLibPaths(JS_LIBS))
    .pipe(gulpConcat('libs.js'))
    .pipe(gulp.dest(ASSETS_PATH + 'dist/js/'))

# Combine custom scripts and library scripts into one file, depends on the handling of custom and library JS
gulp.task 'combineJs', ['customCoffee', 'libJs'], ->
  gulp.src([ASSETS_PATH + 'dist/js/{libs.js,custom.js}'])
    .pipe(gulpConcat('all.js'))
    .pipe(gulp.dest(ASSETS_PATH + 'dist/js/'))

gulp.task 'customStylus', ->
  gulp.src(CUSTOM_STYLUS_PATH)
    .pipe(gulpStylus())
    .pipe(gulpMinifyCss())
    .pipe(gulpConcat('custom.css'))
    .pipe(gulp.dest(ASSETS_PATH + 'dist/css/'))

gulp.task 'libCss', ->
  gulp.src(getLibPaths(CSS_LIBS))
    .pipe(gulpConcat('libs.css'))
    .pipe(gulp.dest(ASSETS_PATH + 'dist/css/'))

# Combine custom styles and library styles into one file, depends the handling of custom and library CSS
gulp.task 'combineCss', ['customStylus', 'libCss'], ->
  gulp.src(ASSETS_PATH + 'dist/css/{libs.css,custom.css}')
    .pipe(gulpConcat('all.css'))
    .pipe(gulp.dest(ASSETS_PATH + '/dist/css/'))

gulp.task 'customJade', ->
  gulp.src(CUSTOM_JADE_PATH)
    .pipe(gulpJade())
    .pipe(gulp.dest(ASSETS_PATH + '/dist/html/'))

# Watch for changes, compile source files and combine into the final JS and CSS file
gulp.task 'watch', ->
  gulp.watch(CUSTOM_COFFEE_PATH, ['customCoffee', 'combineJs'])
  gulp.watch(CUSTOM_STYLUS_PATH, ['customStylus', 'combineCss'])
  gulp.watch(CUSTOM_JADE_PATH,   ['customJade'])

gulp.task 'default',
  ['customCoffee', 'libJs', 'customStylus', 'libCss', 'combineJs', 'combineCss', 'customJade', 'watch']

gulp.task 'build',
  ['customCoffee', 'libJs', 'customStylus', 'libCss', 'combineJs', 'combineCss', 'customJade']
