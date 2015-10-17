angular.module('metroKardma').factory('stations', ['$http', function($http) {
  var o = {
    stations: []
  };

  o.getAll = function() {
    return $http.get('/stations.json').success(function(data){
      console.log(data)
      angular.copy(data, o.stations)
    })
  };

  o.get = function(id) {
    return $http.get('/stations/' + id + '.json').then(function(res) {
      console.log(res.data)
      return res.data;
    })
  }

  return o
}])