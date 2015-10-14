angular.module('metroKardma').controller('AuthCtrl', [
  '$scope',
  '$state',
  'Auth',
  function($scope, $state, Auth) {
    $scope.register = function() {
      Auth.register($scope.user).then(function(){
        $state.go('home');

      });
    };
  }])