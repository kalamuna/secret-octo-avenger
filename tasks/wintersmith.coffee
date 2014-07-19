wintersmith = require('wintersmith')
_ = require('underscore')
config  = require('../config.json')
ghPages = _.defaults(require('../gh-pages.json'), config)





prod = wintersmith(ghPages)

module.exports = (gulp) ->
  gulp.task('preview', ->
    env = wintersmith(config)
    env.preview (error, server) ->
      if error
        throw error
      else
        console.log

  )


  gulp.task('build', ->
    prod = wintersmith(ghPages)
    
    prod.build()
  )


  return gulp
