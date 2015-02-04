var MyApp = angular.module("MyApp");

MyApp.factory('userService',['$resource', function($resource){
	return $resource("users/:id.json", {}, {
		get_user: {method: "GET", params: {id: "@id"}},
		update_user: {method: "PUT", params: {id: "@id"}}
	});	
}]);