angular.module('metroKardma').controller('NavCtrl', [
  '$scope',
  'Auth',
  function($scope, Auth) {
    $scope.signedIn = Auth.isAuthenticated;

    //purpose is to try to authenticate the user on page load
    // Auth.currentUser().then(function(user) {
    //   $scope.user = user;
    // });

    $scope.$on('devise:new-registration', function(e, user) {
        $scope.user = user;
    });
}])