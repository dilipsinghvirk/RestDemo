<!DOCTYPE html>
<html>
<head>
    <meta chrset="UTF 8">
    <title>Event Registration</title>
    <script src="https://code.angularjs.org/1.5.9/angular-route.js"></script>
    <script src="https://code.angularjs.org/1.5.9/angular.min.js"></script>
    <script src="lib/bootstrap.js"></script>

</head>
<body ng-app="sampleApp">

<h1> Guru99 Global Event</h1>

<div class="container">
    <ul><li><a href="#NewEvent"> Add New Event</a></li>
        <li><a href="#DisplayEvent"> Display Event</a></li>
    </ul>
    <div ng-view></div>
</div>

<script>
    var app = angular.module('sampleApp',["ngRoute"]);
    app.config(function($routeProvider){
        $routeProvider.
        when("/NewEvent",{
            templateUrl : "add_event.html",
            controller: "AddEventController"
        }).
        when("/DisplayEvent", {
            templateUrl: "show_event.html",
            controller: "ShowDisplayController"
        });
    });
    app.controller("AddEventController", function($scope) {

        $scope.message = "This is to Add a new Event";

    });
    app.controller("ShowDisplayController",function($scope){

        $scope.message = "This is display an Event";

    });
</script>
</body>
</html>