module.exports = (gulp) ->

  gulp.task('watch', ()->
    gulp.watch('./scripts/**/*.{js,coffee}', ['scripts'])
    gulp.watch('./scss/**/*.scss', ['styles'])
  )
