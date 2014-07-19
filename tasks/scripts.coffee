browserify = require('gulp-browserify')
rename = require('gulp-rename')
uglify = require('gulp-uglify')
yargs = require('yargs')
module.exports = (gulp) ->
  gulp.task('scripts', ->
    gulp.src('./scripts/index.coffee', {read: false})
    .pipe(browserify({
      debug: !yargs.prod
      transform: [
        'coffeeify'
      ]
      extensions: ['.coffee'],
      shim:
        'bootstrap': {
          path:
            './node_modules/bootstrap-sass/assets/javascripts/bootstrap.js'
          depends: {
            'jquery' : 'jQuery'
            }
          exports: null
        }
    }))
    .pipe(rename('project.pkg.js'))
    .pipe(gulp.dest('./contents/js'))
    .pipe(uglify({
      source_map: true
    }))
    .pipe(rename({suffix:'.pkg.min.js'}))
    .pipe(gulp.dest('./contents/js'))
  )
