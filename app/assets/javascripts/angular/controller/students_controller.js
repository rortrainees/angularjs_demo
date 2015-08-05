var myApp = angular.module('myapplication', ['ngRoute', 'ngResource']); 

//Factory
myApp.factory('Students', ['$resource',function($resource){
  return $resource('/students.json', {},{
    query: { method: 'GET', isArray: true },
    create: { method: 'POST' }
  })
}]);

myApp.factory('Students', ['$resource', function($resource){
  return $resource('/studentss/:id.json', {}, {
    show: { method: 'GET' },
    update: { method: 'PUT', params: {id: '@id'} },
    delete: { method: 'DELETE', params: {id: '@id'} }
  });
}]);

//Controller

