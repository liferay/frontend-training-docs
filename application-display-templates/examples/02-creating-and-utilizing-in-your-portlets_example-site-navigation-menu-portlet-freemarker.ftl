<#--
* Entries here refers to the Pages that are in my site.
* The `?has_content` is helper from Freemarker that will check to see if there are Pages.
-->
<#if entries?has_content>
	<#--
	* Like WCM you can write HTML, CSS, and JS in your template.
	* In this case I would probably extract the CSS to the theme for this example
	* we'll just place our CSS here.
	-->
	<style type="text/css" media="screen">
		.nav > li > a {
			display: inline-block;
		}
	</style>

	<nav class="example-navigation-menu-adt-container" id="navigation" role="navigation">
		<ul aria-label="${languageUtil.get(locale, 'site-pages')}" class="list nav nav-nested" role="menubar">
			<#--
			* This is where the magic happens. This `entries` is iterated over and
			* we then have access to the Nav_item. The user interface for creating
			* ADTs will show you what Java Model you're using so that you can
			* see the methods that you can use.
			-->
			<#list entries as nav_item>
				<#--
				* For this example we've created a macro, this will allow us to iterate over all the pages with fewer lines of code in our template
				-->
				<@buildNavigation index=0 nav_item=nav_item />
			</#list>
		</ul>
	</nav>

	<#--
	* `buildNavigation`     builds out the navigation we want. We're going to use some of the new Lexicon markup for a collapsible navigation
	* @param index     {Int} to the level of navigation we are on. This would allow a theme developer to add specific styles for a level of navigation
	* @param nav_item     {Object} this is the page itself, from here I can call various methods to return information
	-->
	<#macro buildNavigation index nav_item>
		<#assign
			nav_item_attr_has_popup = ""
			nav_item_attr_selected = ""
			nav_item_css_class = "nav-item nav-item-level-${index}"
			nav_item_layout = nav_item.getLayout()
		/>

		<#if nav_item.isSelected()>
			<#assign
				nav_item_attr_has_popup = "aria-haspopup='true'"
				nav_item_attr_selected = "aria-selected='true'"
				nav_item_css_class = nav_item_css_class + " selected"
			/>
		</#if>

		<li class="${nav_item_css_class}" id="layout_id_${nav_item.getLayoutId()}"${nav_item_attr_selected} role="presentation"">
			<#if nav_item.hasChildren()>
				<#assign new_index = index + 1 />

				<a aria-labelledby="layout_${nav_item.getLayoutId()}" href="${nav_item.getURL()}" ${nav_item_attr_has_popup} ${nav_item.getTarget()} role="menuitem"><span>${nav_item.getName()}</span></a>

				<a class="collapsed collapse-icon" data-toggle="collapse" href="#${nav_item.getLayoutId()}">
					<span class="collapse-icon-closed icon-caret-right"></span>
					<span class="collapse-icon-open icon-caret-down"></span>
				</a>

				<div class="collapse" id="${nav_item.getLayoutId()}">
					<ul class="nav child-menu child-menu-$index" role="menu">
						<#list nav_item.getChildren() as nav_item_child>
							<@buildNavigation index=new_index nav_item=nav_item_child />
						</#list>
					</ul>
				</div>
			<#else>
				<a aria-labelledby="layout_${nav_item.getLayoutId()}" href="${nav_item.getURL()}" ${nav_item_attr_has_popup} ${nav_item.getTarget()} role="menuitem"><span>${nav_item.getName()}</span></a>
			</#if>
		</li>
	</#macro>
</#if>