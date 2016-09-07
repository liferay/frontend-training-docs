# Creating and contributing new buttons

It is possible to add additional AlloyEditor functionality through OSGi modules. This tutorial will demonstrate how to add a button to the editor.

## Adding OSGi module

AlloyEditor is built on React.js and uses jsx to render handle the interactions for each button in the editor. Here is the folder structure of our module for adding a new button

- `frontend-editor-alloyeditor-accessibility-web`
	- `src`
		- `main`
			- `java`
				- `com/liferay/frontend/editor/alloyeditor/accessibility/web/`
					- `editor`
						- `configuration`
							- `AlloyEditorAccessibilityConfigContributor.java`
					- `servlet`
						- `taglib`
							- `AlloyEditorAccessibilityDynamicInclude.java`
			- `resources`
				- `META-INF`
					- `resources`
						- `js`
							- `button_image_alt.jsx`
	- `.babelrc` - needed since we are compiling `JSX`
	- `bnd.bnd`
		```
		Bundle-Name: Liferay Frontend Editor AlloyEditor Accessibility Web
		Bundle-SymbolicName: com.liferay.frontend.editor.alloyeditor.accessibility.web
		Bundle-Version: 1.0.2
		Liferay-Releng-Module-Group-Description:
		Liferay-Releng-Module-Group-Title: Rich Text Editors
		Web-ContextPath: /frontend-editor-alloyeditor-accessibility-web
		```
	- `build.gradle`
		```
		configJSModules {
			enabled = false
		}

		dependencies {
			provided group: "com.liferay.portal", name: "com.liferay.portal.kernel", version: "2.0.0"
			provided group: "javax.servlet", name: "javax.servlet-api", version: "3.0.1"
			provided group: "org.osgi", name: "org.osgi.service.component.annotations", version: "1.3.0"
		}

		transpileJS {
			bundleFileName = "js/buttons.js"
			globalName = "AlloyEditor.Buttons"
			modules = "globals"
			srcIncludes = "**/*.jsx"
		}
		```
	- `package.json`
		```json
		{
			"devDependencies": {
				"babel-preset-react": "^6.11.1",
				"metal-cli": "^2.0.0"
			},
			"name": "frontend-editor-alloyeditor-accessibility-web",
			"version": "1.0.2"
		}
		```

We've added the contents of some of the files since you'll need some customizations to the build gradle.

## Contents of `button_image_alt.jsx`

Here are the contents of our JSX file
```javascript
/* global React, ReactDOM AlloyEditor */

(function() {
	'use strict';

	var React = AlloyEditor.React;

	var ButtonImageAlt = React.createClass(
		{
			mixins: [AlloyEditor.ButtonStateClasses, AlloyEditor.ButtonCfgProps],

			displayName: 'ButtonImageAlt',

			propTypes: {
				editor: React.PropTypes.object.isRequired
			},

			statics: {
				key: 'imageAlt'
			},

			/**
			 * Lifecycle. Invoked once before the component is mounted.
			 * The return value will be used as the initial value of this.state.
			 *
			 * @method getInitialState
			 */
			getInitialState: function() {
				var image = this.props.editor.get('nativeEditor').getSelection().getSelectedElement();

				return {
					element: image,
					imageAlt: image.getAttribute('alt')
				};
			},

			/**
			 * Lifecycle. Renders the UI of the button.
			 * Rendering alt button or form to update the image´s alt depends on the renderExclusive property
			 *
			 * @method render
			 * @return {Object} The content which should be rendered.
			 */
			render: function() {
				var cssClass = 'ae-button ' + this.getStateClasses();

				var element;

				if (this.props.renderExclusive) {
					return (
						<div className="ae-container-edit-link">
							<div className="ae-container-input xxl">
								<input aria-label="alt" className="ae-input" onChange={this._handleAltChange} onKeyDown={this._handleKeyDown} placeholder="alt" ref="refAltInput" title="alt" type="text" value={this.state.imageAlt}></input>
							</div>
							<button aria-label={AlloyEditor.Strings.confirm} className="ae-button" onClick={this._updateImageAlt} title={AlloyEditor.Strings.confirm}>
								<span className="ae-icon-ok"></span>
							</button>
						</div>
					);
				}
				else {
					return (
						<button className={cssClass} onClick={this._requestExclusive} tabIndex={this.props.tabIndex}>
							<small className="ae-icon small">Alt</small>
						</button>
					);
				}

				return element;
			},

			/**
			 * Focuses the user cursor on the widget's input.
			 *
			 * @protected
			 * @method _focusAltInput
			 */
			_focusAltInput: function() {
				var instance = this;

				var focusAltEl = function() {
					AlloyEditor.ReactDOM.findDOMNode(instance.refs.refAltInput).focus();
				};

				if (window.requestAnimationFrame) {
					window.requestAnimationFrame(focusAltEl);
				}
				else {
					setTimeout(focusAltEl, 0);
				}
			},

			/**
			 * Event attached to alt input that fires when its value is changed
			 *
			 * @protected
			 * @method  _handleAltChange
			 * @param {MouseEvent} event
			 */
			_handleAltChange: function(event) {
				this.setState(
					{
						imageAlt: event.target.value
					}
				);

				this._focusAltInput();
			},

			/**
			 * Event attached to al tinput that fires when key is down
			 * This method check that enter key is pushed to update the component´s state
			 *
			 * @protected
			 * @method  _handleKeyDown
			 * @param {MouseEvent} event
			 */
			_handleKeyDown: function(event) {
				if (event.keyCode === 13) {
					event.preventDefault();

					this._updateImageAlt();
				}
			},

			/**
			 * Requests the link button to be rendered in exclusive mode to allow the creation of a link.
			 *
			 * @protected
			 * @method _requestExclusive
			 */
			_requestExclusive: function() {
				this.props.requestExclusive(ButtonImageAlt.key);
			},

			/**
			 * Method called by clicking ok button or pushing key enter to update imageAlt state and to update alt property from the image that is selected
			 * This method calls cancelExclusive to show the previous toolbar before enter to edit alt property
			 *
			 * @protected
			 * @method  _updateImageAlt
			 */
			_updateImageAlt: function() {
				var editor = this.props.editor.get('nativeEditor');

				var newValue = this.refs.refAltInput.value;

				this.setState(
					{
						imageAlt: newValue
					}
				);

				this.state.element.setAttribute('alt', newValue);

				editor.fire('actionPerformed', this);

				// We need to cancelExclusive with the bound parameters in case the button is used
				// inside another in exclusive mode (such is the case of the alt button)
				this.props.cancelExclusive();
			}
		}
	);

	AlloyEditor.Buttons[ButtonImageAlt.key] = AlloyEditor.ButtonImageAlt = ButtonImageAlt;
}());
```

The file is well documented so take a look at the code. The important lines are those that reference the global `AlloyEditor`. The developer can create their own javascript functions for interactions with their button.

## Contents of `AlloyEditorAccessibilityDynamicInclude`

```java
package com.liferay.frontend.editor.alloyeditor.accessibility.web.servlet.taglib;

import com.liferay.portal.kernel.servlet.taglib.BaseDynamicInclude;
import com.liferay.portal.kernel.servlet.taglib.DynamicInclude;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.PortalUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.WebKeys;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

@Component(immediate = true, service = DynamicInclude.class)
public class AlloyEditorAccessibilityDynamicInclude extends BaseDynamicInclude {

	@Override
	public void include(
			HttpServletRequest request, HttpServletResponse response,
			String key)
		throws IOException {

		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(
			WebKeys.THEME_DISPLAY);

		PrintWriter printWriter = response.getWriter();

		StringBundler sb = new StringBundler(7);

		sb.append("<script src=\"");
		sb.append(themeDisplay.getPortalURL());
		sb.append(PortalUtil.getPathProxy());
		sb.append(_servletContext.getContextPath());
		sb.append("/js/buttons.js");
		sb.append("\" ");
		sb.append("type=\"text/javascript\"></script>");

		printWriter.println(sb.toString());
	}

	@Override
	public void register(DynamicIncludeRegistry dynamicIncludeRegistry) {
		dynamicIncludeRegistry.register(
			"com.liferay.frontend.editor.alloyeditor.web#alloyeditor#" +
				"additionalResources");
	}

	@Reference(
		target = "(osgi.web.symbolicname=com.liferay.frontend.editor.alloyeditor.accessibility.web)"
	)
	private ServletContext _servletContext;
}
```

This file is adds our button to the global alloyeditor that is included through the `<liferay-util:dynamic-include />` taglib. This adds our button as being available to other AlloyEditor instances.

## Contents of `AlloyEditorAccessibilityConfigContributor`
```java

package com.liferay.frontend.editor.alloyeditor.accessibility.web.editor.configuration;

import com.liferay.portal.kernel.editor.configuration.BaseEditorConfigContributor;
import com.liferay.portal.kernel.editor.configuration.EditorConfigContributor;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.portlet.RequestBackedPortletURLFactory;
import com.liferay.portal.kernel.theme.ThemeDisplay;

import java.util.Map;
import java.util.Objects;

import org.osgi.service.component.annotations.Component;

@Component(
	property = {"editor.name=alloyeditor", "service.ranking:Integer=1000"},
	service = EditorConfigContributor.class
)
public class AlloyEditorAccessibilityConfigContributor
	extends BaseEditorConfigContributor {

	@Override
	public void populateConfigJSONObject(
		JSONObject jsonObject, Map<String, Object> inputEditorTaglibAttributes,
		ThemeDisplay themeDisplay,
		RequestBackedPortletURLFactory requestBackedPortletURLFactory) {

		JSONObject toolbarsJSONObject = jsonObject.getJSONObject("toolbars");

		if (toolbarsJSONObject == null) {
			toolbarsJSONObject = JSONFactoryUtil.createJSONObject();
		}

		JSONObject stylesJSONObject = toolbarsJSONObject.getJSONObject(
			"styles");

		if (stylesJSONObject == null) {
			stylesJSONObject = JSONFactoryUtil.createJSONObject();
		}

		JSONArray selectionsJSONArray = stylesJSONObject.getJSONArray(
			"selections");

		for (int i = 0; i < selectionsJSONArray.length(); i++) {
			JSONObject selection = selectionsJSONArray.getJSONObject(i);

			if (Objects.equals(selection.get("name"), "image")) {
				JSONArray buttons = selection.getJSONArray("buttons");

				buttons.put("imageAlt");
			}
		}

		stylesJSONObject.put("selections", selectionsJSONArray);

		toolbarsJSONObject.put("styles", stylesJSONObject);

		jsonObject.put("toolbars", toolbarsJSONObject);
	}

}
```
This file handles where in the toolbar our new button should be. A developer can access the AlloyEditor toolbar and manipulate where there new button should be placed. Since there is no portlet name specified this will be something added for the global AlloyEditor.