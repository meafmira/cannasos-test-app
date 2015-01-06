'use strict';

var gulp = require('gulp');
var reload = require('browser-sync').reload;
gulp.task('setWatch', function() {
  global.isWatching = true;
});

gulp.task('watch', ['setWatch', 'consolidate', 'injector:css', 'browserify'] ,function () {
  gulp.watch('src/{app,components}/**/*.less', ['injector:css']);
  //gulp.watch('src/{app,components}/**/*.{js,coffee}', ['injector:js']);
  gulp.watch('src/assets/images/**/*', ['images']);
  //gulp.watch('bower.json', ['wiredep']);
  gulp.watch('src/{app,components}/**/*.jade', ['consolidate:jade']);
  gulp.watch('.tmp/scripts/**/*.js', reload);
});
