browserify = require('gulp-browserify')
rename = require('gulp-rename')


module.exports = (gulp) ->
  gulp.task('scripts', ->
    gulp.src('./scripts/index.coffee', {read: false})
    .pipe(browserify({
      transform: [
        'coffeeify'
        'partialify'
      ]
      extensions: ['.coffee'],
      shim:
        'X-rayHtlm': {
          path: './node_modules/jquery-plugin/dist/X-rayHTML.min.js',
          depends: {
            'jquery' : 'jQuery'
            }
          exports: null
        }
    }))
    .pipe(rename('pawssf.pkg.js'))
    .pipe(gulp.dest('./contents/js'))
  )
