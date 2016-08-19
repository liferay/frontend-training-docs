# Application Display Templates - Creating and Utilizing ADTs For Your Portlets

## Navigating to ADT creation UI

Now that we have learned about ADTs and how to enable ADTs for custom portlets, lets create an ADT. The user interface for creating ADTs can be found by following the gif below or by navigating to:

<img src="/images/02-creating-and-utilizing-in-your-portlets_navigating-to-adt-user-interface.gif" />

* Site Admin* → Configuration → Application Display Templates

## Creating ADT for Navigation Menu

Now that we are looking at the user interface for ADTs lets add a Navigation Menu ADT. Click on the button in the bottom right corner of the screen to bring up a list of available ADTs and select, 'Navigation Menu'. See gif below as an example:

<img src="/images/02-creating-and-utilizing-in-your-portlets_adding-new-adt.gif" />

## Adding Example ADT for Navigation Menu Portlet

We will be adding the example template that you'll find in the /examples directory for this section. We've included the same example in Velocity and Freemarker to show the templating languages you can use. We've commented the code and will include both examples below:

#### Freemarker

```HTML
<#--
* Entries here refers to the Pages that are in my site.
* The `?has_content` is helper from Freemarker that will check to see if there are Pages.
-->
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
```

#### Velocity

```HTML
##
## Entries here refers to the Pages that are in my site.
## The `.isEmppty()` is helper from Velocity that will check to see if there are Pages.
##
#if (!$entries.isEmpty())
	##
	## Like WCM you can write HTML, CSS, and JS in your template.
	## In this case I would probably extract the CSS to the theme for this example
	## we'll just place our CSS here.
	##
	<style type="text/css" media="screen">
		.nav > li > a {
			display: inline-block;
		}
	</style>

	<nav class="example-navigation-menu-adt-container" id="navigation" role="navigation">
		<ul aria-label="$languageUtil.get($locale, 'site-pages')" class="list nav nav-nested" role="menubar">
			##
			## This is where the magic happens. This `entries` is iterated over and
			## we then have access to the Nav Item. The user interface for creating
			## ADTs will show you what Java Model you're using so that you can
			## see the methods that you can use.
			##
			#foreach ($nav_item in $entries)
				##
				## For this example we've created a macro, this will allow us to iterate over all the pages with fewer lines of code in our template
				##
				#buildNavigation(0, $nav_item)
			#end
		</ul>
	</nav>

	##
	## `buildNavigation`     builds out the navigation we want. We're going to use some of the new Lexicon markup for a collapsible navigation
	## @param index     {Int} to the level of navigation we are on. This would allow a theme developer to add specific styles for a level of navigation
	## @param nav_item     {Object} this is the page itself, from here I can call various methods to return information
	##

	#macro (buildNavigation $index $nav_item)
		#set ($nav_item_attr_has_popup="")
		#set ($nav_item_attr_selected="")
		#set ($nav_item_css_class = "nav-item nav-item-level-${index}")

		#if ($nav_item.isSelected())
			#set ($nav_item_attr_selected="aria-selected='true'")
			#set ($nav_item_css_class = $nav_item_css_class + " selected")
		#end

		#if ($nav_item.hasChildren())
			#set ($nav_item_attr_has_popup="aria-haspopup='true'")
		#end

		<li class="$nav_item_css_class" id="layout_$nav_item.getLayoutId()" $nav_item_attr_selected role="presentation">
			#if ($nav_item.hasChildren())
				#set ($newIndex = $index + 1)

				<a aria-labelledby="layout_$nav_item.getLayoutId()" href="$nav_item.getURL()" $nav_item_attr_has_popup $nav_item.getTarget() role="menuitem"><span>$nav_item.getName()</span></a>

				<a class="collapsed collapse-icon" data-toggle="collapse" href="#$nav_item.getLayoutId()">
					<span class="collapse-icon-closed icon-caret-right"></span>
					<span class="collapse-icon-open icon-caret-down"></span>
				</a>

				<div class="collapse" id="$nav_item.getLayoutId()">
					<ul class="nav child-menu child-menu-$index" role="menu">
						#foreach($nav_child in $nav_item.getChildren())
							#buildNavigation ( $newIndex, $nav_child )
						#end
					</ul>
				</div>
			#else
				<a aria-labelledby="layout_$nav_item.getLayoutId()" href="$nav_item.getURL()" $nav_item_attr_has_popup $nav_item.getTarget() role="menuitem"><span>$nav_item.getName()</span></a>
			#end
		</li>
	#end
#end
```

This will result in a collapsible navigation of the public pages on the site. The markup for the collapsible navigation was taken from the [Lexicon Nav](http://liferay.github.io/lexicon/content/nav/) page.

## Selecting ADT from portlet configuration

Once we have created our ADT, lets us it on a Navigation Menu Portlet. Navigate back to you public pages and deploy the Navigation Menu portlet to the page. Select the `Configuration` option from portlet options menu (the three dots in the top right corner of portlet). You'll see the `Display Template` option, select your ADT and save the changes. You should now see your ADT in action. Please see the gif below for a walkthrough.

<img src="/images/02-creating-and-utilizing-in-your-portlets_adding-code-and-selecting-adt.gif" />