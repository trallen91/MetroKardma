angular.module('metroKardma').controller('StationsCtrl', ['$scope', 'stations', function($scope, stations){
    $scope.stations = stations.stations
}])