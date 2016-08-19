# Liferay Theme Display object in JavaScript

The ThemeDisplay object in Java Provides general configuration methods for the portal, providing access to the portal's pages, sites, themes, locales, URLs, and more. This class is an information context object that holds data commonly referred to for various kinds of front-end information.

There is also a global variable in JavaScript, `Liferay.ThemeDisplay` that contains the same information.  The object contains the following methods.

```javascript
Liferay.ThemeDisplay = {
    getLayoutId: function() {...},
    getLayoutRelativeURL: function() {...},
    getLayoutURL: function() {...},
    getParentLayoutId: function() {...},
    isControlPanel: function() {...},
    isPrivateLayout: function() {...},
    isVirtualLayout: function() {...},
    getBCP47LanguageId: function() {...},
    getCDNBaseURL: function() {...},
    getCDNDynamicResourcesHost: function() {...},
    getCDNHost: function() {...},
    getCompanyGroupId: function() {...},
    getCompanyId: function() {...},
    getDefaultLanguageId: function() {...},
    getDoAsUserIdEncoded: function() {...},
    getLanguageId: function() {...},
    getParentGroupId: function() {...},
    getPathContext: function() {...},
    getPathImage: function() {...},
    getPathJavaScript: function() {...},
    getPathMain: function() {...},
    getPathThemeImages: function() {...},
    getPathThemeRoot: function() {...},
    getPlid: function() {...},
    getPortalURL: function() {...},
    getScopeGroupId: function() {...},
    getScopeGroupIdOrLiveGroupId: function() {...},
    getSessionId: function() {...},
    getSiteGroupId: function() {...},
    getURLControlPanel: function() {...},
    getURLHome: function() {...},
    getUserId: function() {...},
    getUserName: function() {...},
    isAddSessionIdToURL: function() {...},
    isFreeformLayout: function() {...},
    isImpersonated: function() {...},
    isSignedIn: function() {...},
    isStateExclusive: function() {...},
    isStateMaximized: function() {...},
    isStatePopUp: function() {...}
};
```

Here is an example of how it can be used:

```javascript
var themeImageHref = Liferay.ThemeDisplay.getPathThemeImages() + '/file_system/large/default.png';
```