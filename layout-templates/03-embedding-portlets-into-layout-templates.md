# Embedding Portlets into Layout Templates

Using `$theme.runtime()` if the portlet does not have a java class that extends [`BasePortletProvider`](https://github.com/liferay/liferay-portal/blob/master/portal-kernel/src/com/liferay/portal/kernel/portlet/BasePortletProvider.java) or `$processor.processPortlet("CLASS_NAME", ACTION)` if it does, it is possible to embed a portlet in your layout template.

## Using `$theme.runtime()`

In Liferay 6.2 a developer would pass in the portlet id as a paramter into `runtime()`. In DXP the portlet id is no longer a number but a snake case string of the portlet class path. For example in 6.2 a developer could write `$theme.runtime('58')` to embed the login portlet into their layout. In DXP they can accomplish the same thing by passing `$theme.runtime('com_liferay_login_web_portlet_LoginPortlet')`:

```html
<div class="columns-1-2" id="main-content" role="main">
	<div class="portlet-layout">
		<div class="portlet-column portlet-column-only" id="column-1">
			$theme.runtime("com_liferay_login_web_portlet_LoginPortlet")

			$processor.processColumn("column-1", "portlet-column-content portlet-column-content-only")
		</div>
	</div>

	<div class="portlet-layout container">
		<div class="col-md-9 portlet-column portlet-column-first" id="column-2">
			$processor.processColumn("column-2", "portlet-column-content portlet-column-content-first")
		</div>

		<div class="col-md-3 portlet-column portlet-column-last" id="column-3">
			$processor.processColumn("column-3", "portlet-column-content portlet-column-content-last")
		</div>
	</div>
</div>
```

## Using `$processor.processPortlet("CLASS_NAME", ACTION)`

This declaration, just as the theme declaration, expects two parameters: the class name of the entity type you want the portlet to handle and the type of action. If you wanted to embed the `Breadcrumb` portlet into the layout you could use this:

```html
<div class="columns-1-2" id="main-content" role="main">
	<div class="portlet-layout">
		<div class="portlet-column portlet-column-only" id="column-1">
			$processor.processPortlet("com.liferay.portal.kernel.servlet.taglib.ui.BreadcrumbEntry", $portletProviderAction.VIEW)

			$processor.processColumn("column-1", "portlet-column-content portlet-column-content-only")
		</div>
	</div>

	<div class="portlet-layout container">
		<div class="col-md-9 portlet-column portlet-column-first" id="column-2">
			$processor.processColumn("column-2", "portlet-column-content portlet-column-content-first")
		</div>

		<div class="col-md-3 portlet-column portlet-column-last" id="column-3">
			$processor.processColumn("column-3", "portlet-column-content portlet-column-content-last")
		</div>
	</div>
</div>
```