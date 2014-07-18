gulp = require('gulp')
chalk = require('chalk')

require('./wintersmith')(gulp)
require('./sass')(gulp)
require('./scripts')(gulp)
require('./watch')(gulp)
require('./deploy')(gulp)

gulp.task('default', ['scripts', 'sass', 'build'])
gulp.task('dev',['scripts', 'sass', 'preview', 'watch'])


module.exports = gulp
