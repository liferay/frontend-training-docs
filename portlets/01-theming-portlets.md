# Theming Portlets

Liferay themes have the ability to provide additional styles to a portlet. Through the `portlet.ftl` the developer can change markup for the containers that hold portlets.

## Portlet.ftl

Here is a quick look at the default `portlet.ftl` that included in a theme.

```html
<#assign
	portlet_display = portletDisplay

	portlet_back_url = htmlUtil.escapeHREF(portlet_display.getURLBack())
	portlet_content_css_class = "portlet-content"
	portlet_display_name = htmlUtil.escape(portlet_display.getPortletDisplayName())
	portlet_display_root_portlet_id = htmlUtil.escapeAttribute(portlet_display.getRootPortletId())
	portlet_id = htmlUtil.escapeAttribute(portlet_display.getId())
	portlet_title = htmlUtil.escape(portlet_display.getTitle())
/>
```
- `portletDisplay`: is fetched from the `themeDisplay` object and contains infromation about the portlet.
- `portlet_back_url`: URL to return to previous page with portlet `WindowState` is maximized
- `portlet_display_name`: Custom portlet name if set
- `portlet_display_root_portlet_id`:
- `portlet_id`: The id of portlet (not the same as the portlet namespace)
- `portlet_title`: Portlet name set in Portlet java class (usually from a `Keys.java` class).

```
<#if portlet_display.isPortletDecorate() && !portlet_display.isStateMax() && portlet_display.getPortletConfigurationIconMenu()?? && portlet_display.getPortletToolbar()??>
```

This conditional checks to see the portlet header should be displayed. It is checking to see if there portlet toolbar for the portlet (Configuartion, Permissions, Look and Feel)

```
portlet_title_menus = portlet_toolbar.getPortletTitleMenus(portlet_display_root_portlet_id, renderRequest, renderResponse)
```

The portlet title menus is used in portlets that allow for adding resources (Web Content Display, Media Gallery, Documents and Media). It used to build a menu of items for adding resources.

```
portlet_configuration_icons = portlet_configuration_icon_menu.getPortletConfigurationIcons(portlet_display_root_portlet_id, renderRequest, renderResponse)
```

This contains the information for the configuration menu (Configuartion, Permissions, Look and Feel)

The rest of the files contains the HTML markup for the portlet topper and the portlet content. It is possible to add CSS classes, change markup, or add custom information. For styling the look and feel of all portlets, use the CSS classes found in this file in conjunction with the portlet decorators to achieve the desired look and feel.

## Portlet Decorators

In previous versions of Liferay, administrators could display or hide the application borders through the Show Borders option of the look and feel configuration menu. In Liferay 7.0 this option has been replaced with Application Decorators, a more powerful mechanism to customize the style of the application wrapper.

## Out of the box portlet decorators

There are three out of the box portlet decorators that are added to your themes `liferay-look-and-feel.xml`:

- `Barebone`: when this decorator is applied, neither the wrapping box nor the custom application title are shown. This option is recommended when you only want to display the bare application content.
- `Borderless`: when this decorator is applied, the application is no longer wrapped in a white box, but the application custom title is displayed at the top.
- `Decorate`: this is the default Application Decorator when using the Classic theme. When this decorator is applied, the application is wrapped in a white box with a border and the application custom title is displayed at the top.

## Adding your own portlet decorator

To add your own portlet decorator you'll need to follow these steps:

- Add the portlet decorator to your `liferay-look-and-feel.xml`:

```html
<portlet-decorator id="trending" name="Trending">
	<portlet-decorator-css-class>portlet-trending</portlet-decorator-css-class>
</portlet-decorator>
```

- In your theme add `_portlet_decorator.scss` on the same level as your `_custom.scss` and copy the below contents:

```css
.portlet-decorate .portlet-content {
	background: #FFF;
	border: 1px solid #DEEEEE;
}

.portlet-barebone .portlet-content {
	padding: 0;
}
```

- Add your custom CSS to this file

```css
.portlet-decorate .portlet-content {
	background: #FFF;
	border: 1px solid #DEEEEE;
}

.portlet-barebone .portlet-content {
	padding: 0;
}

.portlet-trending .portlet-content {
	background-color: yellow;
	font-size: 12px;
	margin-top: 40px;
	padding: 50px 20px 20px;

	span {
		line-height: 2;
	}

	h3, .h3 {
		font-weight: 300;
	}

	.portlet-title-text {
		border-bottom: 1px solid lighten($main-black-color, 70%);
		font-size: 16px;
		font-weight: 300;
		margin-top: 16px;
		padding-bottom: 10px;
		text-transform: uppercase;

		@include sm {
			margin-top: 30px;
		}
	}

	.table-bordered > tbody > tr > td {
		background-color: $brand-bg-color-2;
		border-color: $brand-bg-color-2;
	}

	.user-name {
		text-decoration: none;
	}

	.user-icon-default {
		display: inline-block;
		vertical-align: middle;
	}
}
```

- Finally add this line to your `_custom.scss` and deploy your theme

```css
@import "portlet_decorator";
```

Once your theme is deployed you can select your new portlet decorator.

## Setting Portlet Decorator

It is possible to set the portlet decorator from a `sitemap.json`:

```json
{
	"portletId": "com_liferay_journal_content_web_portlet_JournalContentPortlet",
	"portletPreferences": {
		"articleId": "My Content.xml",
		"groupId": "${groupId}",
		"portletSetupPortletDecoratorId": "barebone"
	}
}
```
Where `portletSetupPortletDecoratorId` is the id of the decorator to be used. This could be set to our custom decorator id as well. It can be set when embedding portlets in a theme as well:

```html
<#assign VOID = freeMarkerPortletPreferences.setValue("portletSetupPortletDecoratorId", "barebone") />

<div aria-expanded="false" class="collapse navbar-collapse" id="navigationCollapse">
	<#if has_navigation && is_setup_complete>
		<nav class="${nav_css_class} site-navigation" id="navigation" role="navigation">
			<div class="navbar-form navbar-right" role="search">
				<@liferay.search default_preferences= "${freeMarkerPortletPreferences}" />
			</div>

			<div class="navbar-right">
				<@liferay.navigation_menu default_preferences= "${freeMarkerPortletPreferences}" />
			</div>
		</nav>
	</#if>
</div>

<#assign VOID = freeMarkerPortletPreferences.reset() />
```

Since the ADT is creating a new view of an exisiting portlet, the decorator cannot be chagned from the ADT. It can be updated from the portlet Look and Feel menu.