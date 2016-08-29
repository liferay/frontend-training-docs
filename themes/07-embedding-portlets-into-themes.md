# Embedding Portlets into Themes

Using the `liferay-portlet["runtime"]` taglib in your theme you are able to embed a portlet into your theme.

## Understanding `liferay-portlet["runtime"]` taglib

The taglib has a number of attributes that can be used. Here is a brief description of each attribute:

- `defaultPreferences`: This a string of Portlet Preferences for the portlet that will be rendered. It could include look and feel configurations.

- `instanceId`: If the portlet is instanceable this allows for the instance id to be set.

- `persistSettings`: Set this if changes in settings should persist across layouts within the portal.

- `portletName`: Or the portlet id, refers to the string reference of the portlet class path. We will use `com_liferay_login_web_portlet_LoginPortlet` as an example.

- `portletProviderAction`: A new feature of DXP is the ability to determine which deployed portlet to display based on the provider action and class name. This increases the flexibility and modularity of DXP. The four kinds of actions suppoerted are `ADD`, `BROWSE`, `EDIT`, `PREVIEW`, and `VIEW`

- `portletProviderClassName`: In order to use this attribute you'll need to have a java class in the portlet that extends the `BasePortletProvider` and implements one of the above kinds of provider actions. Otherwise you'll want to use the `portletName` attribute

	```java
	@Component(
		immediate = true,
		property = {
			"model.class.name=CLASS_NAME"
		},
		service = ViewPortletProvider.class
	)
	public class MyPortletViewPortletProvider
		extends BasePortletProvider implements ViewPortletProvider {
	}
	```
- `queryString`

- `settingsScope`

## Embedding portlet in theme

Here is an example of embedding the Login Portlet in your theme.

```
<@liferay_portlet["runtime"]
	defaultPreferences=default_preferences
	portletName="com_liferay_login_web_portlet_LoginPortlet"
/>
```
There are also a couple Freemarker macros the Liferay provided to quickly embedded portlets:

- Language Portlet
	```
	<#macro languages
		default_preferences = ""
	>
		<@liferay_portlet["runtime"]
			defaultPreferences=default_preferences
			portletProviderAction=portletProviderAction.VIEW
			portletProviderClassName="com.liferay.portal.kernel.servlet.taglib.ui.LanguageEntry"
		/>
	</#macro>

	<!-- USAGE IN THEME -->
	<@liferay.languages default_preferences="${freeMarkerPortletPreferences}" />
	```

- Navigation Menu Portlet
	```
	<#macro navigation_menu
		default_preferences = ""
		instance_id = ""
	>
		<@liferay_portlet["runtime"]
			defaultPreferences=default_preferences
			instanceId=instance_id
			portletProviderAction=portletProviderAction.VIEW
			portletProviderClassName="com.liferay.portal.kernel.theme.NavItem"
		/>
	</#macro>

	<!-- USAGE IN THEME -->
	<@liferay.navigation_menu default_preferences="${freeMarkerPortletPreferences}" />
	```

- Search Portlet
	```
	<#macro search
		default_preferences = ""
	>
		<#if is_setup_complete>
			<@liferay_portlet["runtime"]
				defaultPreferences=default_preferences
				portletProviderAction=portletProviderAction.VIEW
				portletProviderClassName="com.liferay.admin.kernel.util.PortalSearchApplicationType$Search"
			/>
		</#if>
	</#macro>

	<!-- USAGE IN THEME -->
	<@liferay.search default_preferences="${freeMarkerPortletPreferences}" />
	```

## Portlet Preferences for Embedded Portlets

Using `${freeMarkerPortletPreferences}` it is possible set preferences for your portlet here is an example below

```
<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone") />

<@liferay_portlet["runtime"]
	defaultPreferences="${freeMarkerPortletPreferences}"
	portletName="com_liferay_login_web_portlet_LoginPortlet"
/>

<#assign VOID = freeMarkerPortletPreferences.reset() />
```