angular.module('metroKardma').factory('stations', ['$http', function($http) {
  var o = {
    stations: []
  };

  o.getAll = function() {
    return $http.get('/stations.json').success(function(data){
      console.log(data)
      angular.copy(data, o.stations)
    })
  }

  return o
}])