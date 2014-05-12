App.controller( 'MainCtrl', function ($scope, Groups) {
  $scope.message = "message made available through $scope";
  $scope.foods = Groups.query();
});
