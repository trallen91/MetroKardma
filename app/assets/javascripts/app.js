angular.module('metroKardma', ['ui.router', 'templates', 'Devise'])

angular.module('metroKardma').config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $stateProvider.state('home', {
      url: '/home',
      templateUrl: 'home/_home.html',
      controller: 'MainCtrl',
      resolve: {
        postPromise: ['stations', function(stations) {
          return stations.getAll();
        }]
      }
    });

    $stateProvider.state('stations', {
      url: '/stations/{id}',
      templateUrl: 'stations/_stations.html',
      controller: 'StationsCtrl',
      resolve: {
        station: ['$stateParams', 'stations', function($stateParams, stations){
          return stations.get($stateParams.id)
        }]
      }
    })

    $urlRouterProvider.otherwise('home');
  }])

