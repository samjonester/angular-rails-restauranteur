module.exports = function(config) {
  config.set({
    basePath: '../..',

    frameworks: ['jasmine'],

    autoWatch: true,

    browsers: [
      'PhantomJS'
    ],

    files: [
      //Bower
      'lib/assets/bower_components/angular/angular.js',
      'lib/assets/bower_components/angular-ui-router/release/angular-ui-router.js',
      'lib/assets/bower_components/angular-mocks/angular-mocks.js',
      //Mine
      'app/assets/javascript/**/*.js.coffee',
      'spec/javascripts/**/*.js.coffee'
    ],

    plugins: [
      'karma-phantomjs-launcher'
    ]
  });
};
