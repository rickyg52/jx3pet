/* global angular */
/* global window */
/* jshint node:true */
'use strict';

var appName = 'jx3pet';
var app = angular.module(appName, [
  'angularUtils.directives.dirPagination',
  'cropme',
  'angular-underscore',
  'ngMaterial',
  'ngMdIcons',
  'ngMessages',
  'ngSanitize',
  'ngResource',
  'ui.router',
  'yaru22.angular-timeago',
  'angularMaterialAdmin'
]);

/**
 * When a XHR request takes place we show the progress bar at the top of the header
 */
app.factory('globalInterceptor', [
  '$rootScope',
  '$q',
  function($rootScope, $q) {
    return {
      'request': function(config) {
        $rootScope.stateLoadingStatus = "indeterminate";
        return config;
      },
      'response': function(response) {
        $rootScope.stateLoadingStatus = undefined;
        return response;
      },
      'responseError': function(rejection) {
        $rootScope.stateLoadingStatus = undefined;
        return $q.reject(rejection);
      }
    };
  }
]);

/**
 * We manually set the xhr header so that devise understands that this is an xhr request
 * during login and does not respond with a 302 which angular cannot handle - as the browser
 * handles this before angular can get a hold of it
 */
app.config([
  '$httpProvider',
  function($httpProvider) {
    $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
    $httpProvider.interceptors.push('globalInterceptor');
  }
]);

/**
 * Set the default template for paging directive
 */
app.config([
  'paginationTemplateProvider',
  function(paginationTemplateProvider) {
    paginationTemplateProvider.setPath('common/common.paging.html');
  }
]);

app.config(['$provide', function($provide) {
  $provide.decorator('dirPaginationControlsDirective', ['$delegate', function($delegate) {

    var directive = $delegate[0];
    var link = directive.link;

    /**
     * We cannot directly add to the directives scope because the original directive
     * whitelists the scope variables, so we patch scope in the link function.
     */
    directive.compile = function() {
      return function(scope, element, attrs) {
        link.apply(this, arguments);
        if (attrs.noDataStatement && attrs.noDataStatement !== '') {
          scope.noDataStatement = attrs.noDataStatement;
        } else {
          scope.noDataStatement = 'No data';
        }
      };
    };

    return $delegate;
  }]);
}]);

/**
 * This is a fix for the facebook redirect bug
 */
if (window.location.hash === '#_=_') {
  window.location.hash = '#!';
}