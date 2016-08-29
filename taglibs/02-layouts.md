# Taglibs - Page Layout

Page layout taglibs allow developers to create layouts using Bootstrap 3 within their portlet.

## `<aui: />` Taglibs

The following `<aui:>` taglibs can be used to create layouts:

- `<aui:container>`: Creates a container `<div>` tag to wrap `<aui:row>` components and offer additional styling.
	- (boolean) `fluid`: Whether to enable the container to span the entire width of the viewport. The default value is true.
	- (String) `cssClass`: A CSS class for styling the component.
	- (String) `id`: An ID for the component instance.
	- `dynamicAttributes` Map<String, Object>: Map of `data-` attributes for your container
- `<aui:row>`:  Creates a row to hold `<aui:col>` components.
	- (String) `cssClass`: A CSS class for styling the component.
	- (String) `id`: An ID for the component instance.
- `<aui:col>`: Creates a column to display content in an `<aui:row>` component.
	- (String) `cssClass`: A CSS class for styling the component.
	- (String) `id`: An ID for the component instance.
	- (String) `lg`: Comma separated string of numbers 1-12 to be used for Boostrap grid `col-lg-`
	- (String) `md`: Comma separated string of numbers 1-12 to be used for Boostrap grid `col-md-`
	- (String) `sm`: Comma separated string of numbers 1-12 to be used for Boostrap grid `col-sm-`
	- (String) `xs`: Comma separated string of numbers 1-12 to be used for Boostrap grid `col-xs-`
	- (int) `span`: The width of the column in the containing row as a fraction of 12. For example, a span of 4 would result in a column width 4/12 (or 1/3) of the total width of the containing row.
	- (int) `width`: The width of the column in the containing row as a percentage, overriding the span attribute. The width is then converted to a span expressed as ((width/100) x 12), rounded to the nearest whole number. For example, a width of 33 would be converted to 3.96, which would be rounded up to a span value of 4.

## Example `jsp`

Here is an example layout created in a portlet

```html
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<aui:container cssClass='super-awesome-container'>
	<aui:row>
		<aui:col md="4" sm="6">
			<h2>Some fun content using the 'md' and 'sm' attributes</h2>
		</aui:col>

		<aui:col md="8" sm="6">
			<p>
				Selvage vegan bespoke literally consequat. Swag mollit waistcoat biodiesel nesciunt. Green juice slow-carb messenger bag sed in PBR&B commodo, elit sartorial listicle umami. Gentrify art party blog, ethical cornhole XOXO before they sold out raw denim incididunt letterpress keffiyeh meggings. Deep v fugiat culpa delectus. Marfa shabby chic chartreuse, bushwick laborum crucifix cardigan hoodie humblebrag consectetur. Mixtape kinfolk +1 tempor, master cleanse williamsburg ethical dolore sed stumptown adipisicing venmo veniam chillwave laborum.
			</p>
		</aui:col>
	</aui:row>

	<aui:row>
		<aui:col width="<%= 40 %>">
			<h2>Some fun content using the 'width' attribute</h2>
		</aui:col>

		<aui:col width="<%= 60 %>">
			<p>
				Selvage vegan bespoke literally consequat. Swag mollit waistcoat biodiesel nesciunt. Green juice slow-carb messenger bag sed in PBR&B commodo, elit sartorial listicle umami. Gentrify art party blog, ethical cornhole XOXO before they sold out raw denim incididunt letterpress keffiyeh meggings. Deep v fugiat culpa delectus. Marfa shabby chic chartreuse, bushwick laborum crucifix cardigan hoodie humblebrag consectetur. Mixtape kinfolk +1 tempor, master cleanse williamsburg ethical dolore sed stumptown adipisicing venmo veniam chillwave laborum.
			</p>
		</aui:col>
	</aui:row>

	<aui:row>
		<aui:col span="<%= 4 %>">
			<h2>Some fun content using the 'span' attribute</h2>
		</aui:col>

		<aui:col span="<%= 8 %>">
			<p>
				Selvage vegan bespoke literally consequat. Swag mollit waistcoat biodiesel nesciunt. Green juice slow-carb messenger bag sed in PBR&B commodo, elit sartorial listicle umami. Gentrify art party blog, ethical cornhole XOXO before they sold out raw denim incididunt letterpress keffiyeh meggings. Deep v fugiat culpa delectus. Marfa shabby chic chartreuse, bushwick laborum crucifix cardigan hoodie humblebrag consectetur. Mixtape kinfolk +1 tempor, master cleanse williamsburg ethical dolore sed stumptown adipisicing venmo veniam chillwave laborum.
			</p>
		</aui:col>
	</aui:row>
</aui:container>
```