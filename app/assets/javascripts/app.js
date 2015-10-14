angular.module('metroKardma', ['ui.router'])

angular.module('metroKardma').config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $stateProvider.state('stations', {
      url: '/stations',
      templateUrl: '/stations.html',
      controller: 'StationsCtrl'
    });

    $urlRouterProvider.otherwise('stations');
  }])

angular.module('metroKardma').controller('StationsCtrl', ['$scope', function($scope){

}])