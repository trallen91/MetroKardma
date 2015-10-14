angular.module('metroKardma').controller('MainCtrl', ['$scope', 'stations', function($scope, stations){
    $scope.stations = stations.stations
}])