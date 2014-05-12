var service = angular.module("apiService", ["ngResource"]);

service.factory("Groups", function($resource) {
  return $resource(
    "/food_groups/:Id",
    {Id: "@Id"},
    {
      "update": {method: "PUT"}
    }
  );
});
