# Customizing Existing Frontends in Liferay Portal 7

Sometimes it is necessary to customize the frontend resources of Liferay and its' applications.

## Overriding a Modules JSPs

Liferay applications often contain JSPs. Sometimes you might need to override one of them. If you need to override the JSPs from a module deployed to the OSGi runtime, you need a fragment module.  A fragment module needs to do two things to accomplish this:

#### Specify host module
Specifies the "host" module's symbolic name and exact version.  The host module is the module that contains the JSP that will be overridden.  This is done by adding the `Fragment-Host` header like this:
```
Fragment-Host: com.liferay.login.web;bundle-version="1.0.0"
```

#### Create Fragment JSP

Provides a copy of the original JSP containing the intended modifications.  The JSP in the fragment must match the directory structure of the host module.  For example:

Let's say you want to override this file in the Liferay Login Web module:
```
login-web/src/main/resources/META-INF/resources/login.jsp
```

Your fragment module would have to mimmick the same relative file structure:

```
my-jsp-fragment/src/main/resource/META-INF/resource/login.jsp
```

## Overriding Core JSPs

Most JSPs in Liferay have been modularized and are no longer in core.  But some remain and are located in the `portal-web/docroot/html` directory. If it is necessary to modify a core JSP, you need a module that does the following:

- Create a class that implements `CustomJspBag`.

```java
    public class MyCustomJspBag implements CustomJspBag {
        @Activate
        protected void activate(BundleContext bundleContext) {
            bundle = bundleContext.getBundle();

            _customJsps = new ArrayList<>();

            Enumeration<URL> entries = bundle.findEntries(
                getCustomJspDir(), "*.jsp", true);

            while (entries.hasMoreElements()) {
                URL url = entries.nextElement();

                _customJsps.add(url.getPath());
            }
        }

        //You will also have to override the following methods

        public String getCustomJspDir() {...} //Return the directory path in your module’s JAR where the JSPs are placed (for example, META-INF/jsps).
        public List<String> getCustomJsps() {...} //Return a List of the custom JSP URL paths.
        public URLContainer getURLContainer() {...} //Return a new com.liferay.portal.kernel.url.URLContainer that returns the new resources.
        public boolean isCustomJspGlobal() {...} //Return true

        private List<String> _customJsps;
        private Bundle bundle;
    }
```

- Registers the service in the OSGi runtime.

```java
    @Component(
        property = {
        "context.id=MyCustomJspBag",
        "context.name=My Custom JSP Bag",
        "service.ranking:Integer=" + Integer.MAX_VALUE
        }
    )
    public class MyCustomJspBag implements CustomJspBag {
```

- And finally, provided the JSP you’re extending in your bundle.



## Overriding MVC Commands

MVC Commands are used to break up the controller layer of a Liferay MVC application into smaller, more digestible code chunks. They are implemented in an application as OSGi components with two properties:

- `javax.portlet.name`: the portlet that is affected by this command. It’s often specified in a -PortletKeys class inside the application.

- `mvc.command.name`: a key to identify the particular command

You can override the MVC commands of any portlet if you can find the values for these two properties.

You can override MVCRenderCommand for any portlet that uses Liferay’s MVC framework and publishes an MVCRenderCommand component.

For example, Liferay’s Blogs application has a class called EditEntryMVCRenderCommand, with this component:

```java
@Component(
    immediate = true,
    property = {
        "javax.portlet.name=" + BlogsPortletKeys.BLOGS,
        "javax.portlet.name=" + BlogsPortletKeys.BLOGS_ADMIN,
        "javax.portlet.name=" + BlogsPortletKeys.BLOGS_AGGREGATOR,
        "mvc.command.name=/blogs/edit_entry"
    },
    service = MVCRenderCommand.class
)
```

This MVC render command can be invoked from any of the portlets specified by the `javax.portlet.name` parameter, by calling a render URL that names the MVC command.

```xml
<portlet:renderURL var="addEntryURL">
    <portlet:param name="mvcRenderCommandName" value="/blogs/edit_entry" />
    <portlet:param name="redirect" value="<%= viewEntriesURL %>" />
</portlet:renderURL>
```

## Using Dynamic Include

TODO: using dynamic include