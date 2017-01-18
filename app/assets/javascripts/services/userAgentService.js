(function(){

  angular
       .module('app')
       .factory('UserAgentService', UserAgentService);
/**
 * The user agent service is used to check for compatible browsers
 */
  function UserAgentService() {

    return {
      supported: supported,
      simpleName: simpleName,
      version: version,
      osName: osName,
      isWebkit: isWebkit,
      isIe: isIe,
      isEdge: isEdge
    };

    /**
     * Check browser compatibility, if not compatible redirect user to the new page. We use
     * hard coded numbers, which is okay because it is localised
     */
    function supported() {
      // TODO: searchbot temp hack,
      // we can remove this once bowser approves the googlebot pull request and we update
      // parseFloat will turn 8.4.1 -> 8.4
      if ((/googlebot/i.test(navigator.userAgent)) ||
         (/bingbot/i.test(navigator.userAgent)) ||
         (bowser.safari && version() >= 7) ||
         (bowser.firefox && version() >= 40) ||
         (bowser.chrome && version() >= 42) ||
         (bowser.msie && version() >= 11) ||
         (bowser.opera && version() >= 31) ||
         (bowser.msedge) ||
         // Different iphone user agents populate different version fields
         (bowser.ios && (version() >= 8.0 || parseFloat(bowser.osversion) >= 8.0))) {
        return true;
      } else {
        return false;
      }
    }

    /**
     * Retrieves a simple name to identify the user agent
     */
    function simpleName() {
      // TODO: searchbot temp hack, strictly not needed, since no one is viewing the app as googlebot,
      // we can remove this once bowser approves the googlebot pull request and we update
      if (/googlebot/i.test(navigator.userAgent)) {
        return 'googlebot';
      } else if (/bingbot/i.test(navigator.userAgent)) {
        return 'bingbot';
      } else {
        return bowser.name.toLowerCase();
      }
    }

    /**
     * Retrieves the browser version
     */
    function version() {
      return parseFloat(bowser.version);
    }

    /**
     * Retrieves the os
     */
    function osName() {
      if (bowser.ios) {
        return 'ios';
      } else {
        return '';
      }
    }

    /**
     * Checks for webkit browser
     */
    function isWebkit() {
      if (bowser.webkit) {
        return true;
      } else {
        return false;
      }
    }

    /**
     * Checks for ie with optional version
     */
    function isIe(browserVersion) {
      if (browserVersion) {
        if (bowser.msie && version() === browserVersion) {
          return true;
        }
      } else if (bowser.msie) {
        return true;
      }
      return false;
    }

    /**
     * Checks for msedge with optional version
     */
    function isEdge(browserVersion) {
      if (browserVersion) {
        if (bowser.msedge && version() === browserVersion) {
          return true;
        }
      } else if (bowser.msedge) {
        return true;
      }
      return false;
    }
  }
});