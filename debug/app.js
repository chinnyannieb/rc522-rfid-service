angular.module('app', [])
    .controller('RfidController', ['$scope', 'io', function($scope, io){
        $scope.list = [];

        io.on('tap', function(data){
            $scope.list.push({
                rfid: data.rfid,
                date: new Date()
            });
            $scope.$apply();
        });
    }])
    .service('io', [function(){
        return io();
    }]);