app.controller('ApplicationController', [
  '$window',
  '$rootScope',
  '$scope',
  '$mdSidenav',
  '$state',
  '$location',
  '$mdMedia',
  'UserAgentService',
  function($window, $rootScope, $scope, $mdSidenav, $state, $location, $mdMedia, UserAgentService) {

    (function () {
      $rootScope.today = new Date();
      $rootScope.theme = 'default';
      $rootScope.UserAgentService = UserAgentService;
      $rootScope.signedIn = false;

      /**
       * Media specific css
       * Usage in templates:
       * ng-class="{ 'small-button': $root.$mdMedia('sm') }"
       */
      $rootScope.$mdMedia = $mdMedia;

      //checkSignIn();

      $scope.toggleSidenav = function(menuId) {
        $mdSidenav(menuId).toggle();
      };

      /**
       * Check the type of browser and version
       */
      if (UserAgentService.supported()) {
        addBrowserToHtmlTag();
      } else {
        $state.go('outdatedBrowser');
      }
    })();

    /**
     * Adds the browser name to the header
     */
    function addBrowserToHtmlTag() {
      var doc = document.documentElement;
      doc.setAttribute('data-browser', UserAgentService.simpleName());
      doc.setAttribute('data-browser-version', UserAgentService.version());
      doc.setAttribute('data-os', UserAgentService.osName());
    }

    /**
     * Checks the user's signed in state
     */
    // function checkSignIn() {
    //   SessionsService.getSessionPromise()
    //     .then(function(session) {
    //       $rootScope.signedIn = true;
    //     }, function() {
    //       $rootScope.signedIn = false;
    //     });
    // }

    /**
     * When a state change occurs we check whether the user is signed in
     */
    $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams) {
      checkSignIn();
    });

    /**
     * When ever a state change occurs we track where the user wants to go
     */
    $rootScope.$on('$stateChangeStart', function(event, toState, toParams, fromState, fromParams) {
      // If the path is secured, then bookmark it in the event we need to redirect back here
      if (toState.authenticate) {
        $rootScope.toState  = toState;
        $rootScope.toParams = toParams;
      }

      // TODO: Maybe this needs to go after sign in?
      // SessionsService.getSession(function(session) {
      //   analytics.identify(session.user.email, {
      //     firstName: session.user.first_name,
      //     lastName: session.user.last_name,
      //     email: session.user.email
      //   });
      // });
    });

    /**
     * Setup a global function to track events on as needed basis
     */
    $rootScope.trackEvent = function(name) {
      analytics.track(name, {});
    };

    /**
     * Setup a global function to track events on as needed basis with data
     */
    $rootScope.trackEventWithData = function(name, data) {
      analytics.track(name, data);
    };

    /**
     * Setup a global function to trigger history back
     */
    $rootScope.historyBack = function() {
      $window.history.back();
    };
}]);