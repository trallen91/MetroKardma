angular.module('metroKardma', ['ui.router', 'templates'])

angular.module('metroKardma').config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $stateProvider.state('stations', {
      url: '/stations',
      templateUrl: 'stations/_stations.html',
      controller: 'StationsCtrl',
      resolve: {
        postPromise: ['stations', function(stations) {
          return stations.getAll();
        }]
      }
    });

    $urlRouterProvider.otherwise('stations');
  }])

