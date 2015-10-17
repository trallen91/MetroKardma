angular.module('metroKardma').controller('StationsCtrl', [
  '$scope',
  'stations',
  'station',
  function($scope, stations, station) {
    $scope.station = station;
}])