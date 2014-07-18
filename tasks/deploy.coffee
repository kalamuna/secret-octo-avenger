ghPages = require('gulp-gh-pages')

module.exports = (gulp) ->

  gulp.task 'deploy', ['default'], ->
    gulp.src('./build/**/*')
    .pipe(ghPages())
