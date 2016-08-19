# Application Display Templates - ADT Usage In Portlets

## How to use ADT in custom portlet

To leverage the ADT API, there are several steps you need to follow. These steps involve registering your portlet to use ADTs, defining permissions, and exposing the ADT functionality to users. You’ll walk through these steps now:

1. Create and register a custom `*PortletDisplayTemplateHandler` component. Liferay provides the [BasePortletDisplayTemplateHandler](https://docs.liferay.com/portal/7.0/javadocs/portal-kernel/com/liferay/portal/kernel/portletdisplaytemplate/BasePortletDisplayTemplateHandler.html) as a base implementation for you to extend. You can check the TemplateHandler interface Javadoc to learn about each template handler method. As an example `*PortletDisplayTemplateHandler implementation`, you can look at [WikiPortletDisplayTemplateHandler.java](https://github.com/liferay/liferay-portal/blob/master/modules/apps/collaboration/wiki/wiki-web/src/main/java/com/liferay/wiki/web/internal/portlet/template/WikiPortletDisplayTemplateHandler.java).

2. Since the ability to add ADTs is new to your portlet, you must configure permissions so that administrative users can grant permissions to the roles that will be allowed to create and manage display templates. Add the action key ADD_PORTLET_DISPLAY_TEMPLATE to your portlet’s /src/main/resources/resource-actions/default.xml file:

	```XML
	<?xml version="1.0"?>

	<!DOCTYPE resource-action-mapping PUBLIC "-//Liferay//DTD Resource Action Mapping 7.0.0//EN" "http://www.liferay.com/dtd/liferay-resource-action-mapping_7_0_0.dtd">

	<resource-action-mapping>

	    ...

	    <portlet-resource>
	        <portlet-name>yourportlet</portlet-name>
	        <permissions>
	            <supports>
	                <action-key>ADD_PORTLET_DISPLAY_TEMPLATE</action-key>
	                <action-key>ADD_TO_PAGE</action-key>
	                <action-key>CONFIGURATION</action-key>
	                <action-key>VIEW</action-key>
	            </supports>

	            ...

	        </permissions>
	    </portlet-resource>

	    ...

	</resource-action-mapping>
	```

3. Now that your portlet officially supports ADTs, you’ll want to expose the ADT option to your users. Just include the `<liferay-ui:ddm-template-selector>` tag in the JSP file you’re using to control your portlet’s configuration. As an example JSP, see the Wiki application’s [configuration.jsp](https://github.com/liferay/liferay-portal/blob/master/modules/apps/collaboration/wiki/wiki-web/src/main/resources/META-INF/resources/wiki/configuration.jsp).

4. You must now extend your view code to render your portlet with the selected ADT. This allows you to decide which part of your view will be rendered by the ADT and what will be available in the template context. You'll need to set up what you want to allow the ADT to mark up and pass that to `<liferay-ddm:template-renderer>` as `entries`. As an example JSP, see the Wiki application’s [view.jsp](https://github.com/liferay/liferay-portal/blob/master/modules/apps/collaboration/wiki/wiki-web/src/main/resources/META-INF/resources/wiki/view.jsp).

---


Now that your portlet supports ADTs, you can create your own scripts to change the display of your portlet. You can experiment by adding your own custom ADT. We'll cover this in the next section.