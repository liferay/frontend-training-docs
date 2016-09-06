# Liferay Iternal API's

The `Liferay` javascript object is populated with some helpful tools that you are able to use. Below you'll find some of the various API's on the object:

## `Liferay.ThemeDisplay`
```javascript
Liferay.ThemeDisplay = {
    <c:if test="<%= layout != null %>">
        getLayoutId: function() {
            return '<%= layout.getLayoutId() %>';
        },
        getLayoutRelativeURL: function() {
            return '<%= PortalUtil.getLayoutRelativeURL(layout, themeDisplay) %>';
        },
        getLayoutURL: function() {
            return '<%= PortalUtil.getLayoutURL(layout, themeDisplay) %>';
        },
        getParentLayoutId: function() {
            return '<%= layout.getParentLayoutId() %>';
        },
        isControlPanel: function() {
            return <%= layout.isTypeControlPanel() %>;
        },
        isPrivateLayout: function() {
            return '<%= layout.isPrivateLayout() %>';
        },
        isVirtualLayout: function() {
            return <%= (layout instanceof VirtualLayout) %>;
        },
    </c:if>

    getBCP47LanguageId: function() {
        return '<%= LanguageUtil.getBCP47LanguageId(request) %>';
    },
    getCDNBaseURL: function() {
        return '<%= themeDisplay.getCDNBaseURL() %>';
    },
    getCDNDynamicResourcesHost: function() {
        return '<%= themeDisplay.getCDNDynamicResourcesHost() %>';
    },
    getCDNHost: function() {
        return '<%= themeDisplay.getCDNHost() %>';
    },
    getCompanyGroupId: function() {
        return '<%= themeDisplay.getCompanyGroupId() %>';
    },
    getCompanyId: function() {
        return '<%= themeDisplay.getCompanyId() %>';
    },
    getDefaultLanguageId: function() {
        return '<%= LocaleUtil.toLanguageId(themeDisplay.getSiteDefaultLocale()) %>';
    },
    getDoAsUserIdEncoded: function() {
        return '<%= UnicodeFormatter.toString(themeDisplay.getDoAsUserId()) %>';
    },
    getLanguageId: function() {
        return '<%= LanguageUtil.getLanguageId(request) %>';
    },
    getParentGroupId: function() {
        return '<%= themeDisplay.getSiteGroupId() %>';
    },
    getPathContext: function() {
        return '<%= themeDisplay.getPathContext() %>';
    },
    getPathImage: function() {
        return '<%= themeDisplay.getPathImage() %>';
    },
    getPathJavaScript: function() {
        return '<%= themeDisplay.getPathJavaScript() %>';
    },
    getPathMain: function() {
        return '<%= themeDisplay.getPathMain() %>';
    },
    getPathThemeImages: function() {
        return '<%= themeDisplay.getPathThemeImages() %>';
    },
    getPathThemeRoot: function() {
        return '<%= themeDisplay.getPathThemeRoot() %>';
    },
    getPlid: function() {
        return '<%= themeDisplay.getPlid() %>';
    },
    getPortalURL: function() {
        return '<%= themeDisplay.getPortalURL() %>';
    },
    getScopeGroupId: function() {
        return '<%= themeDisplay.getScopeGroupId() %>';
    },
    getScopeGroupIdOrLiveGroupId: function() {
        return '<%= themeDisplay.getSiteGroupIdOrLiveGroupId() %>';
    },
    getSessionId: function() {
        return '<%= PropsValues.SESSION_ENABLE_URL_WITH_SESSION_ID ? session.getId() : StringPool.BLANK %>';
    },
    getSiteGroupId: function() {
        return '<%= themeDisplay.getSiteGroupId() %>';
    },
    getURLControlPanel: function() {
        return '<%= themeDisplay.getURLControlPanel() %>';
    },
    getURLHome: function() {
        return '<%= HtmlUtil.escapeJS(themeDisplay.getURLHome()) %>';
    },
    getUserId: function() {
        return '<%= themeDisplay.getUserId() %>';
    },
    getUserName: function() {
        return '<%= themeDisplay.isSignedIn() ? UnicodeFormatter.toString(user.getFullName()) : StringPool.BLANK %>';
    },
    isAddSessionIdToURL: function() {
        return <%= themeDisplay.isAddSessionIdToURL() %>;
    },
    isFreeformLayout: function() {
        return <%= themeDisplay.isFreeformLayout() %>;
    },
    isImpersonated: function() {
        return <%= themeDisplay.isImpersonated() %>;
    },
    isSignedIn: function() {
        return <%= themeDisplay.isSignedIn() %>;
    },
    isStateExclusive: function() {
        return <%= themeDisplay.isStateExclusive() %>;
    },
    isStateMaximized: function() {
        return <%= themeDisplay.isStateMaximized() %>;
    },
    isStatePopUp: function() {
        return <%= themeDisplay.isStatePopUp() %>;
    }
};
```

## `Liferay.AUI`
```javascript
Liferay.AUI = {
    Object {}
    getAvailableLangPath: function() {...}
    getCombine: function() {...}
    getComboPath: function() {...}
    getDateFormat: function() {...}
    getEditorCKEditorPath: function() {...}
    getFilter: function() {...}
    getFilterConfig: function() {...}
    getJavaScriptRootPath: function() {...}
    getLangPath: function() {...}
    getPortletRootPath: function() {...}
    getStaticResourceURLParams: function() {...}
}
```

## `Liferay.Browser`
```javascript
var Liferay = Liferay || {};

        Liferay.Browser = {
            acceptsGzip: function() {
                return <%= BrowserSnifferUtil.acceptsGzip(request) %>;
            },
            getMajorVersion: function() {
                return <%= BrowserSnifferUtil.getMajorVersion(request) %>;
            },
            getRevision: function() {
                return '<%= BrowserSnifferUtil.getRevision(request) %>';
            },
            getVersion: function() {
                return '<%= BrowserSnifferUtil.getVersion(request) %>';
            },
            isAir: function() {
                return <%= BrowserSnifferUtil.isAir(request) %>;
            },
            isChrome: function() {
                return <%= BrowserSnifferUtil.isChrome(request) %>;
            },
            isFirefox: function() {
                return <%= BrowserSnifferUtil.isFirefox(request) %>;
            },
            isGecko: function() {
                return <%= BrowserSnifferUtil.isGecko(request) %>;
            },
            isIe: function() {
                return <%= BrowserSnifferUtil.isIe(request) %>;
            },
            isIphone: function() {
                return <%= BrowserSnifferUtil.isIphone(request) %>;
            },
            isLinux: function() {
                return <%= BrowserSnifferUtil.isLinux(request) %>;
            },
            isMac: function() {
                return <%= BrowserSnifferUtil.isMac(request) %>;
            },
            isMobile: function() {
                return <%= BrowserSnifferUtil.isMobile(request) %>;
            },
            isMozilla: function() {
                return <%= BrowserSnifferUtil.isMozilla(request) %>;
            },
            isOpera: function() {
                return <%= BrowserSnifferUtil.isOpera(request) %>;
            },
            isRtf: function() {
                return <%= BrowserSnifferUtil.isRtf(request) %>;
            },
            isSafari: function() {
                return <%= BrowserSnifferUtil.isSafari(request) %>;
            },
            isSun: function() {
                return <%= BrowserSnifferUtil.isSun(request) %>;
            },
            isWebKit: function() {
                return <%= BrowserSnifferUtil.isWebKit(request) %>;
            },
            isWindows: function() {
                return <%= BrowserSnifferUtil.isWindows(request) %>;
            }
        };
```

## `Liferay.PropsValues`
```javascript
Liferay.PropsValues = {
    JAVASCRIPT_SINGLE_PAGE_APPLICATION_TIMEOUT: <%= PrefsPropsUtil.getInteger(themeDisplay.getCompanyId(), PropsKeys.JAVASCRIPT_SINGLE_PAGE_APPLICATION_TIMEOUT, PropsValues.JAVASCRIPT_SINGLE_PAGE_APPLICATION_TIMEOUT) %>,
    NTLM_AUTH_ENABLED: <%= PrefsPropsUtil.getBoolean(themeDisplay.getCompanyId(), PropsKeys.NTLM_AUTH_ENABLED, PropsValues.NTLM_AUTH_ENABLED) %>,
    UPLOAD_SERVLET_REQUEST_IMPL_MAX_SIZE: <%= PrefsPropsUtil.getLong(PropsKeys.UPLOAD_SERVLET_REQUEST_IMPL_MAX_SIZE, PropsValues.UPLOAD_SERVLET_REQUEST_IMPL_MAX_SIZE) %>
};
```

## `Liferay.PortletKeys`
```javascript
Liferay.PortletKeys = {
            DOCUMENT_LIBRARY: '<%= PortletKeys.DOCUMENT_LIBRARY %>',
            DYNAMIC_DATA_MAPPING: 'com_liferay_dynamic_data_mapping_web_portlet_DDMPortlet',
            ITEM_SELECTOR: '<%= PortletKeys.ITEM_SELECTOR %>'
};
```
## `Liferay.Data`
```javascript
Liferay.Data = Liferay.Data || {};
Liferay.Data.NAV_SELECTOR = '#navigation';
Liferay.Data.NAV_SELECTOR_MOBILE = '#navigationCollapse';
Liferay.Data.isCustomizationView = function() {
    return <%= (layoutTypePortlet.isCustomizable() && LayoutPermissionUtil.contains(permissionChecker, layout, ActionKeys.CUSTOMIZE)) %>;
};

Liferay.Data.notices = [
    null

    <c:if test="<%= permissionChecker.isOmniadmin() && PortalUtil.isUpdateAvailable() %>">
        , {
            content: '<a class="update-available" href="<%= themeDisplay.getURLUpdateManager() %>"><liferay-ui:message key="updates-are-available-for-liferay" /></a>',
            toggleText: false
        }
    </c:if>

    <c:if test="<%= ShutdownUtil.isInProcess() %>">
        , {
            node: '#lfrShutdownMessage',
            toggleText: false
        }
    </c:if>
];
```

## `Liferay.authToken`
```javascript
Liferay.authToken = '<%= AuthTokenUtil.getToken(request) %>';
Liferay.currentURL = '<%= HtmlUtil.escapeJS(currentURL) %>';
Liferay.currentURLEncoded = '<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(currentURL)) %>';
```

## `Liferay.currentURL`
```javascript
Liferay.currentURL = '<%= HtmlUtil.escapeJS(currentURL) %>';
Liferay.currentURLEncoded = '<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(currentURL)) %>';
```

## `Liferay.currentURLEncoded`
```javascript
Liferay.currentURLEncoded = '<%= HtmlUtil.escapeJS(HttpUtil.encodeURL(currentURL)) %>';
```

## `Liferay.Portlet`
Custom portlets that implment their own module will add to the preexisiting `Liferay.Portlet` object. An example of this can be seen in the [Google Maps Portlet](https://github.com/liferay/liferay-portal/blob/master/modules/apps/google-maps/google-maps-web/src/main/resources/META-INF/resources/js/main.js). By adding the module `Liferay.Portlet` it will be availble globally.

## `Liferay.PortletURL`
This provides a way to create Liferay PortletURL's such as `actionURL`, `renderURL`, and `resourceURL` through javascript. Here is an example:

```javascript
var portletURL = Liferay.PortletURL.createURL(themeDisplay.getURLControlPanel());

portletURL.setDoAsGroupId('true');
portletURL.setLifecycle(Liferay.PortletURL.ACTION_PHASE);
portletURL.setParameter('cmd', 'add_temp');
portletURL.setParameter('javax.portlet.action', '/document_library/upload_file_entry');
portletURL.setParameter('p_auth', Liferay.authToken);
portletURL.setPortletId(Liferay.PortletKeys.DOCUMENT_LIBRARY);
```

## `Liferay.MAPS` and `Liferay.MODULES`
In DXP the new Loader makes it possible to add some third party modules and dependencies for your modules. These two objects make it possible to see what modules are being loaded into the portlet for each module.

Here is an example of `Liferay.MAPS`:
```javascript
Liferay.MAPS = {
    classic-theme: "classic-theme@1.0.2"
    com.liferay.announcements.web: "com.liferay.announcements.web@1.0.5"
    com.liferay.application.list.taglib: "com.liferay.application.list.taglib@2.0.4"
    com.liferay.asset.browser.web: "com.liferay.asset.browser.web@1.0.6"
    com.liferay.asset.categories.admin.web: "com.liferay.asset.categories.admin.web@1.0.9"
    com.liferay.asset.categories.navigation.web: "com.liferay.asset.categories.navigation.web@1.0.4"
    com.liferay.asset.display.web: "com.liferay.asset.display.web@1.0.1"
    com.liferay.asset.entry.query.processor.custom.user.attributes: "com.liferay.asset.entry.query.processor.custom.user.attributes@2.0.2"
    com.liferay.asset.publisher.web: "com.liferay.asset.publisher.web@1.1.5"
    com.liferay.asset.taglib: "com.liferay.asset.taglib@2.0.3"
    com.liferay.asset.tags.admin.web: "com.liferay.asset.tags.admin.web@1.0.3"
    com.liferay.asset.tags.compiler.web: "com.liferay.asset.tags.compiler.web@2.0.1"
    com.liferay.asset.tags.navigation.web: "com.liferay.asset.tags.navigation.web@2.0.2"
    com.liferay.asset.web: "com.liferay.asset.web@2.0.1"
    com.liferay.blogs.item.selector.web: "com.liferay.blogs.item.selector.web@1.0.2"
    com.liferay.blogs.recent.bloggers.web: "com.liferay.blogs.recent.bloggers.web@1.0.3"
    com.liferay.blogs.web: "com.liferay.blogs.web@1.0.11"
    com.liferay.bookmarks.web: "com.liferay.bookmarks.web@1.0.9"
    com.liferay.calendar.web: "com.liferay.calendar.web@1.0.7"
    com.liferay.comment.page.comments.web: "com.liferay.comment.page.comments.web@1.0.2"
    com.liferay.comment.web: "com.liferay.comment.web@1.0.5"
    com.liferay.configuration.admin.web: "com.liferay.configuration.admin.web@1.0.5"
    com.liferay.contacts.web: "com.liferay.contacts.web@1.0.10"
    com.liferay.directory.web: "com.liferay.directory.web@1.0.5"
    com.liferay.document.library.item.selector.web: "com.liferay.document.library.item.selector.web@1.0.2"
    com.liferay.document.library.web: "com.liferay.document.library.web@1.0.10"
    com.liferay.dynamic.data.lists.form.web: "com.liferay.dynamic.data.lists.form.web@1.0.9"
    com.liferay.dynamic.data.lists.web: "com.liferay.dynamic.data.lists.web@1.1.5"
    com.liferay.dynamic.data.mapping.data.provider.web: "com.liferay.dynamic.data.mapping.data.provider.web@1.0.4"
    com.liferay.dynamic.data.mapping.form.renderer: "com.liferay.dynamic.data.mapping.form.renderer@2.1.1"
    com.liferay.dynamic.data.mapping.taglib: "com.liferay.dynamic.data.mapping.taglib@2.0.2"
    com.liferay.dynamic.data.mapping.type.button: "com.liferay.dynamic.data.mapping.type.button@1.0.0"
    com.liferay.dynamic.data.mapping.type.captcha: "com.liferay.dynamic.data.mapping.type.captcha@2.0.2"
    com.liferay.dynamic.data.mapping.type.checkbox: "com.liferay.dynamic.data.mapping.type.checkbox@2.0.6"
    com.liferay.dynamic.data.mapping.type.date: "com.liferay.dynamic.data.mapping.type.date@2.0.6"
    com.liferay.dynamic.data.mapping.type.editor: "com.liferay.dynamic.data.mapping.type.editor@2.0.6"
    com.liferay.dynamic.data.mapping.type.key.value: "com.liferay.dynamic.data.mapping.type.key.value@2.0.4"
    com.liferay.dynamic.data.mapping.type.options: "com.liferay.dynamic.data.mapping.type.options@2.0.4"
    com.liferay.dynamic.data.mapping.type.paragraph: "com.liferay.dynamic.data.mapping.type.paragraph@2.0.5"
    com.liferay.dynamic.data.mapping.type.radio: "com.liferay.dynamic.data.mapping.type.radio@2.0.7"
    com.liferay.dynamic.data.mapping.type.select: "com.liferay.dynamic.data.mapping.type.select@2.0.6"
    com.liferay.dynamic.data.mapping.type.text: "com.liferay.dynamic.data.mapping.type.text@2.0.6"
    com.liferay.dynamic.data.mapping.type.validation: "com.liferay.dynamic.data.mapping.type.validation@2.0.3"
    com.liferay.dynamic.data.mapping.web: "com.liferay.dynamic.data.mapping.web@1.0.9"
    com.liferay.expando.web: "com.liferay.expando.web@1.0.3"
    com.liferay.exportimport.web: "com.liferay.exportimport.web@1.0.9"
    com.liferay.filtered.asset.display.web: "com.liferay.filtered.asset.display.web@1.0.0"
    com.liferay.flags.taglib: "com.liferay.flags.taglib@2.0.2"
    com.liferay.flags.web: "com.liferay.flags.web@2.0.2"
    com.liferay.frontend.css.web: "com.liferay.frontend.css.web@1.0.8"
    com.liferay.frontend.editor.alloyeditor.web: "com.liferay.frontend.editor.alloyeditor.web@1.0.5"
    com.liferay.frontend.editor.ckeditor.web: "com.liferay.frontend.editor.ckeditor.web@1.0.5"
    com.liferay.frontend.editor.simple.web: "com.liferay.frontend.editor.simple.web@1.0.2"
    com.liferay.frontend.editor.tinymce.web: "com.liferay.frontend.editor.tinymce.web@1.0.2"
    com.liferay.frontend.image.editor.integration.document.library: "com.liferay.frontend.image.editor.integration.document.library@1.0.2"
    com.liferay.frontend.js.polyfill.babel.web: "com.liferay.frontend.js.polyfill.babel.web@1.0.2"
    com.liferay.frontend.js.soyutils.web: "com.liferay.frontend.js.soyutils.web@1.0.3"
    com.liferay.frontend.js.web: "com.liferay.frontend.js.web@1.0.8"
    com.liferay.frontend.taglib: "com.liferay.frontend.taglib@2.0.3"
    com.liferay.hello.soy.web: "com.liferay.hello.soy.web@1.0.1"
    com.liferay.hello.velocity.web: "com.liferay.hello.velocity.web@2.0.2"
    com.liferay.hello.world.web: "com.liferay.hello.world.web@2.0.1"
    com.liferay.iframe.web: "com.liferay.iframe.web@1.0.4"
    com.liferay.image.uploader.web: "com.liferay.image.uploader.web@1.0.4"
    com.liferay.invitation.invite.members.web: "com.liferay.invitation.invite.members.web@1.0.8"
    com.liferay.item.selector.taglib: "com.liferay.item.selector.taglib@1.0.6"
    com.liferay.item.selector.upload.web: "com.liferay.item.selector.upload.web@2.0.1"
    com.liferay.item.selector.url.web: "com.liferay.item.selector.url.web@2.0.1"
    com.liferay.item.selector.web: "com.liferay.item.selector.web@2.0.2"
    com.liferay.journal.content.asset.addon.entry.comments: "com.liferay.journal.content.asset.addon.entry.comments@1.0.3"
    com.liferay.journal.content.asset.addon.entry.conversions: "com.liferay.journal.content.asset.addon.entry.conversions@2.0.1"
    com.liferay.journal.content.asset.addon.entry.locales: "com.liferay.journal.content.asset.addon.entry.locales@1.0.2"
    com.liferay.journal.content.asset.addon.entry.print: "com.liferay.journal.content.asset.addon.entry.print@2.0.1"
    com.liferay.journal.content.asset.addon.entry.ratings: "com.liferay.journal.content.asset.addon.entry.ratings@2.0.1"
    com.liferay.journal.content.asset.addon.entry.related.assets: "com.liferay.journal.content.asset.addon.entry.related.assets@2.0.1"
    com.liferay.journal.content.search.web: "com.liferay.journal.content.search.web@1.0.2"
    com.liferay.journal.content.web: "com.liferay.journal.content.web@1.0.7"
    com.liferay.journal.item.selector.web: "com.liferay.journal.item.selector.web@1.0.2"
    com.liferay.journal.terms.of.use: "com.liferay.journal.terms.of.use@2.0.6"
    com.liferay.journal.web: "com.liferay.journal.web@1.2.2"
    com.liferay.layout.admin.web: "com.liferay.layout.admin.web@1.0.10"
    com.liferay.layout.item.selector.web: "com.liferay.layout.item.selector.web@1.1.0"
    com.liferay.layout.prototype.web: "com.liferay.layout.prototype.web@1.0.6"
    com.liferay.layout.set.prototype.web: "com.liferay.layout.set.prototype.web@1.0.7"
    com.liferay.layout.taglib: "com.liferay.layout.taglib@2.0.5"
    com.liferay.layout.type.controller.control.panel: "com.liferay.layout.type.controller.control.panel@2.0.1"
    com.liferay.layout.type.controller.full.page.application: "com.liferay.layout.type.controller.full.page.application@2.0.1"
    com.liferay.layout.type.controller.node: "com.liferay.layout.type.controller.node@2.0.1"
    com.liferay.layout.type.controller.shared.portlet: "com.liferay.layout.type.controller.shared.portlet@2.0.1"
    com.liferay.license.manager.web: "com.liferay.license.manager.web@2.0.1"
    com.liferay.login.authentication.facebook.connect.web: "com.liferay.login.authentication.facebook.connect.web@2.0.2"
    com.liferay.login.authentication.google.web: "com.liferay.login.authentication.google.web@2.0.1"
    com.liferay.login.authentication.openid.web: "com.liferay.login.authentication.openid.web@2.0.2"
    com.liferay.login.web: "com.liferay.login.web@1.0.5"
    com.liferay.map.common: "com.liferay.map.common@2.0.1"
    com.liferay.map.google.maps: "com.liferay.map.google.maps@1.0.5"
    com.liferay.map.openstreetmap: "com.liferay.map.openstreetmap@2.0.1"
    com.liferay.map.taglib: "com.liferay.map.taglib@1.0.4"
    com.liferay.marketplace.app.manager.web: "com.liferay.marketplace.app.manager.web@1.0.7"
    com.liferay.marketplace.store.web: "com.liferay.marketplace.store.web@2.0.2"
    com.liferay.mentions.web: "com.liferay.mentions.web@1.0.4"
    com.liferay.message.boards.web: "com.liferay.message.boards.web@1.0.8"
    com.liferay.microblogs.web: "com.liferay.microblogs.web@2.0.5"
    com.liferay.mobile.device.rules.web: "com.liferay.mobile.device.rules.web@1.0.8"
    com.liferay.monitoring.web: "com.liferay.monitoring.web@1.0.4"
    com.liferay.my.account.web: "com.liferay.my.account.web@1.0.2"
    com.liferay.nested.portlets.web: "com.liferay.nested.portlets.web@2.0.2"
    com.liferay.notifications.web: "com.liferay.notifications.web@1.0.8"
    com.liferay.password.policies.admin.web: "com.liferay.password.policies.admin.web@1.0.10"
    com.liferay.plugins.admin.web: "com.liferay.plugins.admin.web@1.0.3"
    com.liferay.polls.web: "com.liferay.polls.web@2.0.5"
    com.liferay.portal.instances.web: "com.liferay.portal.instances.web@1.0.3"
    com.liferay.portal.search.web: "com.liferay.portal.search.web@1.1.2"
    com.liferay.portal.security.audit.web: "com.liferay.portal.security.audit.web@1.0.2"
    com.liferay.portal.security.service.access.policy.web: "com.liferay.portal.security.service.access.policy.web@1.0.5"
    com.liferay.portal.settings.authentication.cas.web: "com.liferay.portal.settings.authentication.cas.web@1.0.3"
    com.liferay.portal.settings.authentication.facebook.connect.web: "com.liferay.portal.settings.authentication.facebook.connect.web@1.0.3"
    com.liferay.portal.settings.authentication.google.web: "com.liferay.portal.settings.authentication.google.web@1.0.2"
    com.liferay.portal.settings.authentication.ldap.web: "com.liferay.portal.settings.authentication.ldap.web@1.0.4"
    com.liferay.portal.settings.authentication.ntlm.web: "com.liferay.portal.settings.authentication.ntlm.web@1.0.3"
    com.liferay.portal.settings.authentication.openid.web: "com.liferay.portal.settings.authentication.openid.web@1.0.3"
    com.liferay.portal.settings.authentication.opensso.web: "com.liferay.portal.settings.authentication.opensso.web@1.0.3"
    com.liferay.portal.settings.web: "com.liferay.portal.settings.web@1.0.5"
    com.liferay.portal.workflow.definition.link.web: "com.liferay.portal.workflow.definition.link.web@1.0.3"
    com.liferay.portal.workflow.definition.web: "com.liferay.portal.workflow.definition.web@1.0.4"
    com.liferay.portal.workflow.instance.web: "com.liferay.portal.workflow.instance.web@1.0.5"
    com.liferay.portal.workflow.kaleo.designer.web: "com.liferay.portal.workflow.kaleo.designer.web@1.0.1"
    com.liferay.portal.workflow.kaleo.forms.web: "com.liferay.portal.workflow.kaleo.forms.web@1.0.1"
    com.liferay.portal.workflow.task.web: "com.liferay.portal.workflow.task.web@1.0.5"
    com.liferay.portlet.configuration.css.web: "com.liferay.portlet.configuration.css.web@2.0.2"
    com.liferay.portlet.configuration.sharing.web: "com.liferay.portlet.configuration.sharing.web@2.0.2"
    com.liferay.portlet.configuration.web: "com.liferay.portlet.configuration.web@1.0.6"
    com.liferay.product.navigation.control.menu.dxp.theme.contributor: "com.liferay.product.navigation.control.menu.dxp.theme.contributor@1.0.4"
    com.liferay.product.navigation.control.menu.web: "com.liferay.product.navigation.control.menu.web@2.0.4"
    com.liferay.product.navigation.product.menu.dxp.theme.contributor: "com.liferay.product.navigation.product.menu.dxp.theme.contributor@1.0.2"
    com.liferay.product.navigation.product.menu.web: "com.liferay.product.navigation.product.menu.web@2.0.2"
    com.liferay.product.navigation.simulation.device: "com.liferay.product.navigation.simulation.device@2.0.2"
    com.liferay.product.navigation.simulation.theme.contributor: "com.liferay.product.navigation.simulation.theme.contributor@2.0.1"
    com.liferay.product.navigation.simulation.web: "com.liferay.product.navigation.simulation.web@2.0.2"
    com.liferay.product.navigation.site.administration: "com.liferay.product.navigation.site.administration@2.0.1"
    com.liferay.product.navigation.taglib: "com.liferay.product.navigation.taglib@2.0.3"
    com.liferay.product.navigation.user: "com.liferay.product.navigation.user@2.0.1"
    com.liferay.product.navigation.user.personal.bar.web: "com.liferay.product.navigation.user.personal.bar.web@2.0.1"
    com.liferay.quick.note.web: "com.liferay.quick.note.web@2.0.1"
    com.liferay.ratings.page.ratings.web: "com.liferay.ratings.page.ratings.web@2.0.2"
    com.liferay.recent.documents.web: "com.liferay.recent.documents.web@2.0.2"
    com.liferay.roles.admin.web: "com.liferay.roles.admin.web@1.0.9"
    com.liferay.roles.selector.web: "com.liferay.roles.selector.web@1.0.4"
    com.liferay.rss.web: "com.liferay.rss.web@2.0.2"
    com.liferay.server.admin.web: "com.liferay.server.admin.web@1.0.6"
    com.liferay.site.admin.web: "com.liferay.site.admin.web@1.0.9"
    com.liferay.site.browser.web: "com.liferay.site.browser.web@2.0.5"
    com.liferay.site.item.selector.web: "com.liferay.site.item.selector.web@2.0.4"
    com.liferay.site.memberships.web: "com.liferay.site.memberships.web@1.0.11"
    com.liferay.site.my.sites.web: "com.liferay.site.my.sites.web@1.0.5"
    com.liferay.site.navigation.breadcrumb.web: "com.liferay.site.navigation.breadcrumb.web@2.0.2"
    com.liferay.site.navigation.directory.web: "com.liferay.site.navigation.directory.web@2.0.2"
    com.liferay.site.navigation.language.web: "com.liferay.site.navigation.language.web@2.0.1"
    com.liferay.site.navigation.menu.web: "com.liferay.site.navigation.menu.web@2.0.2"
    com.liferay.site.navigation.site.map.web: "com.liferay.site.navigation.site.map.web@2.0.1"
    com.liferay.site.navigation.taglib: "com.liferay.site.navigation.taglib@2.0.3"
    com.liferay.site.teams.web: "com.liferay.site.teams.web@1.0.8"
    com.liferay.social.activities.web: "com.liferay.social.activities.web@1.0.3"
    com.liferay.social.activity.web: "com.liferay.social.activity.web@2.0.2"
    com.liferay.social.group.statistics.web: "com.liferay.social.group.statistics.web@2.0.1"
    com.liferay.social.privatemessaging.web: "com.liferay.social.privatemessaging.web@1.0.6"
    com.liferay.social.requests.web: "com.liferay.social.requests.web@1.0.2"
    com.liferay.social.user.statistics.web: "com.liferay.social.user.statistics.web@2.0.2"
    com.liferay.staging.bar.web: "com.liferay.staging.bar.web@1.0.4"
    com.liferay.staging.configuration.web: "com.liferay.staging.configuration.web@1.0.4"
    com.liferay.staging.processes.web: "com.liferay.staging.processes.web@1.0.5"
    com.liferay.staging.taglib: "com.liferay.staging.taglib@3.1.3"
    com.liferay.sync.web: "com.liferay.sync.web@1.0.2"
    com.liferay.trash.taglib: "com.liferay.trash.taglib@2.0.3"
    com.liferay.trash.web: "com.liferay.trash.web@1.0.6"
    com.liferay.user.groups.admin.web: "com.liferay.user.groups.admin.web@1.0.5"
    com.liferay.users.admin.web: "com.liferay.users.admin.web@2.0.5"
    com.liferay.web.proxy.web: "com.liferay.web.proxy.web@1.0.2"
    com.liferay.wiki.engine.creole: "com.liferay.wiki.engine.creole@2.0.1"
    com.liferay.wiki.engine.html: "com.liferay.wiki.engine.html@2.0.1"
    com.liferay.wiki.engine.input.editor.common: "com.liferay.wiki.engine.input.editor.common@2.0.1"
    com.liferay.wiki.engine.text: "com.liferay.wiki.engine.text@2.0.1"
    com.liferay.wiki.navigation.web: "com.liferay.wiki.navigation.web@2.0.4"
    com.liferay.wiki.web: "com.liferay.wiki.web@1.0.11"
    com.liferay.xsl.content.web: "com.liferay.xsl.content.web@2.0.2"
    documentum-hook: "documentum-hook@7.0.10.3"
    employee-lookup-web: "employee-lookup-web@1.0.0"
    frontend-image-editor-capability-brightness: "frontend-image-editor-capability-brightness@1.0.2"
    frontend-image-editor-capability-contrast: "frontend-image-editor-capability-contrast@1.0.2"
    frontend-image-editor-capability-crop: "frontend-image-editor-capability-crop@1.0.2"
    frontend-image-editor-capability-effects: "frontend-image-editor-capability-effects@1.0.2"
    frontend-image-editor-capability-resize: "frontend-image-editor-capability-resize@1.0.2"
    frontend-image-editor-capability-rotate: "frontend-image-editor-capability-rotate@1.0.2"
    frontend-image-editor-capability-saturation: "frontend-image-editor-capability-saturation@1.0.2"
    frontend-image-editor-web: "frontend-image-editor-web@1.0.1"
    frontend-js-metal-web: "frontend-js-metal-web@1.0.7"
    frontend-js-spa-web: "frontend-js-spa-web@1.0.7"
    html2incdom: "frontend-js-metal-web@1.0.7/html2incdom"
    lcs-portlet: "lcs-portlet@7.0.10.2"
    metal: "frontend-js-metal-web@1.0.7/metal"
    metal-affix: "frontend-js-metal-web@1.0.7/metal-affix"
    metal-ajax: "frontend-js-spa-web@1.0.7/metal-ajax"
    metal-alert: "frontend-js-metal-web@1.0.7/metal-alert"
    metal-anim: "frontend-js-metal-web@1.0.7/metal-anim"
    metal-autocomplete: "frontend-js-metal-web@1.0.7/metal-autocomplete"
    metal-button-group: "frontend-js-metal-web@1.0.7/metal-button-group"
    metal-clipboard: "frontend-js-metal-web@1.0.7/metal-clipboard"
    metal-component: "frontend-js-metal-web@1.0.7/metal-component"
    metal-datatable: "frontend-js-metal-web@1.0.7/metal-datatable"
    metal-debounce: "frontend-js-metal-web@1.0.7/metal-debounce"
    metal-dom: "frontend-js-metal-web@1.0.7/metal-dom"
    metal-drag-drop: "frontend-js-metal-web@1.0.7/metal-drag-drop"
    metal-dropdown: "frontend-js-metal-web@1.0.7/metal-dropdown"
    metal-events: "frontend-js-metal-web@1.0.7/metal-events"
    metal-incremental-dom: "frontend-js-metal-web@1.0.7/metal-incremental-dom"
    metal-jquery-adapter: "frontend-js-metal-web@1.0.7/metal-jquery-adapter"
    metal-list: "frontend-js-metal-web@1.0.7/metal-list"
    metal-modal: "frontend-js-metal-web@1.0.7/metal-modal"
    metal-multimap: "frontend-js-spa-web@1.0.7/metal-multimap"
    metal-pagination: "frontend-js-metal-web@1.0.7/metal-pagination"
    metal-popover: "frontend-js-metal-web@1.0.7/metal-popover"
    metal-position: "frontend-js-metal-web@1.0.7/metal-position"
    metal-progressbar: "frontend-js-metal-web@1.0.7/metal-progressbar"
    metal-promise: "frontend-js-metal-web@1.0.7/metal-promise"
    metal-rating: "frontend-js-metal-web@1.0.7/metal-rating"
    metal-scrollspy: "frontend-js-metal-web@1.0.7/metal-scrollspy"
    metal-select: "frontend-js-metal-web@1.0.7/metal-select"
    metal-slider: "frontend-js-metal-web@1.0.7/metal-slider"
    metal-soy: "frontend-js-metal-web@1.0.7/metal-soy"
    metal-soy-bundle: "frontend-js-metal-web@1.0.7/metal-soy-bundle"
    metal-state: "frontend-js-metal-web@1.0.7/metal-state"
    metal-switcher: "frontend-js-metal-web@1.0.7/metal-switcher"
    metal-toggler: "frontend-js-metal-web@1.0.7/metal-toggler"
    metal-tooltip: "frontend-js-metal-web@1.0.7/metal-tooltip"
    metal-treeview: "frontend-js-metal-web@1.0.7/metal-treeview"
    metal-uri: "frontend-js-spa-web@1.0.7/metal-uri"
    metal-useragent: "frontend-js-spa-web@1.0.7/metal-useragent"
    securescape-theme: "securescape-theme@7.0.10"
    senna: "frontend-js-spa-web@1.0.7/senna"
    sharepoint-hook: "sharepoint-hook@7.0.10.3"
    user-dashboard-theme: "user-dashboard-theme@1.0.2"
    user-profile-theme: "user-profile-theme@1.0.2"
}
```
This shows all of the included module names, the module their blong to and that modules version number.

Here is an example of `Liferay.MODULES`:

```javascript
Liferay.MODULES = {
    ...
    frontend-image-editor-capability-crop@1.0.2/CropHandles.es: {...}
    frontend-image-editor-capability-crop@1.0.2/CropHandles.soy: {
        conditionalMark: false,
        dependencies: ["exports", "metal-component/src/Component", "metal-soy/src/Soy"]
    }
    "frontend-image-editor-capability-crop@1.0.2/CropHandles.soy": {...}
    ...
}
```
This object displays each module and their dependencies.