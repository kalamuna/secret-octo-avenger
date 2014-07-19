sass = require('gulp-sass')
prefix = require('gulp-autoprefixer')
cssmin = require('gulp-cssmin')
rename = require('gulp-rename')
csslint = require('gulp-csslint')
csscomb = require('gulp-csscomb')


module.exports =  (gulp) ->
  gulp.task 'sass', ->
    gulp.src('./scss/*.scss')
    .pipe(sass({
      includePaths: [
        'node_modules',
        'bower_components'
        ]
      sourceMap: 'map'
      }))
    .pipe( prefix("last 1 version", "> 1%", "ie 8", "ie 7", { cascade: true } ))
    .pipe(gulp.dest('./contents/css'))
    .pipe(csscomb())
    .pipe(csslint('.csslintrc.json'))
    .pipe(csslint.reporter())
    .pipe(cssmin())
    .pipe(rename({suffix: '.min'}))
    .pipe(gulp.dest('./contents/css'))
