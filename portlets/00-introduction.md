# Portlets

## Types of Portlet in Liferay DXP

In Liferay DXP it is possible to create:

- Liferay MVC Portlet
	- Traditional Model View Controller style portlet that helps to separate concerns of View, Render, Action, and Resouce requests into different Java classes for more modularity
- Soy Portlet
	- Please see the documentation on Soy Portlets for more information
- Spring MVC
	- Spring MVC is the web component of Spring's framework. It provides a rich functionality for building robust Web Applications. The Spring MVC Framework is architected and designed in such a way that every piece of logic and functionality is highly configurable. In DXP you can still use features like the Service Builder
- JavaSever Faces
	- Liferay Faces is an open source umbrella project that provides support for the JavaServer™ Faces (JSF) standard in webapp and portlet projects.
	- Please see the [Liferay Faces](http://www.liferayfaces.org/) page for more information.

## Creating a portlet using `blade` cli

The Blade CLI is a command line java tool that can be used to help bootstrap Liferay 7 module development. It is installed using a java package manager called jpm4j. It makes it easy to create modules in Liferay. A MVC Portlet can be created with the following command:

```
blade create -t mvcportlet -p [package name] -c [class name] [project name]
```

Here is a working example:

```
blade create -t mvcportlet -p com.liferay.docs.mvcportlet -c MyMvcPortlet my-mvc-portlet-project
```

After running this from your Liferay Workspace modules folder you'll see the created module:

- `my-mvc-portlet-project`
	- `src`
		- `main`
			- `java`
				- `com/liferay/docs/mvcportlet`
					- `MyMvcPortlet.java`
			- `resources`
				- `content`
					- `Language.properties`
				- `META-INF`
					- `resources`
						- `css`
							- `main.scss`
						- `js`
							- `main.js`
					 	- `init.jsp`
					 	- `view.jsp`
	- `bnd.bnd`
	- `build.gradle`

From here you can use the Liferay MVC Framework for creating your portlet.

Inside your `MyMvcPortlet.java` you'll want to make sure you have the following code

```java
@Component(
    immediate = true,
    property = {
        "com.liferay.portlet.css-class-wrapper=portlet-my-mvc-portlet",
        "com.liferay.portlet.display-category=category.sample",
        "com.liferay.portlet.footer-portlet-javascript=/js/main.js",
        "com.liferay.portlet.header-portlet-css=/css/main.css",
        "com.liferay.portlet.preferences-owned-by-group=true",
        "com.liferay.portlet.private-request-attributes=false",
        "com.liferay.portlet.private-session-attributes=false",
        "com.liferay.portlet.remoteable=true",
        "com.liferay.portlet.render-weight=50",
        "com.liferay.portlet.use-default-template=true",
        "javax.portlet.display-name=My MVC Portlet",
        "javax.portlet.expiration-cache=0",
        "javax.portlet.init-param.template-path=/",
        "javax.portlet.init-param.view-template=/view.jsp",
        "javax.portlet.init-param.always-display-default-configuration-icons=true",
        "javax.portlet.name=My MVC Portlet",
        "javax.portlet.resource-bundle=content.Language",
        "javax.portlet.security-role-ref=guest,power-user,user",
        "javax.portlet.supports.mime-type=text/html"
    },
    service = Portlet.class
)
public class MyMvcPortlet extends MVCPortlet {
}
```

You are good to go, start building your portlet!