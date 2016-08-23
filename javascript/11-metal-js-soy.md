# Metal.js - Soy Templates

## What are Soy Templates?

[Soy Templates](https://developers.google.com/closure/templates/) are developed by Google are a client- and server-side templating system that helps you dynamically build reusable HTML and UI elements. They have a simple syntax that is natural for programmers, and you can customize them to fit your application's needs. In contrast to traditional templating systems, in which you must create one monolithic template per page, you can think of Closure Templates as small components that you compose to form your user interface. You can also use the built-in message support to easily localize your applications.

Example Soy Template code:

```html
{namespace Modal}

/**
 * This renders the component's whole content.
 * Note: has to be called ".render".
 */
{template .render}
  <div>Hello World</div>
{/template}
```

## Why use Soy Templates?

- **Convenience.** Closure Templates provide an easy way to build pieces of HTML for your application's UI and help you separate application logic from display.
- **Language-neutral.** Closure Templates work with JavaScript or Java. You can write one template and share it between your client- and server-side code.
- **Client-side speed.** Closure Templates are compiled to efficient JavaScript functions for maximum client-side performance.
- **Easy to read.** You can clearly see the structure of the output HTML from the structure of the template code. Messages for translation are inline for extra readability.
- **Designed for programmers.** Templates are simply functions that can call each other. The syntax includes constructs familiar to programmers. You can put multiple templates in one source file.
- **A tool, not a framework.** Works well in any web application environment in conjunction with any libraries, frameworks, or other tools.
- **Battle-tested.** Closure Templates are used extensively in some of the largest web applications in the world, including Gmail and Google Docs.
- **Secure**. Closure Templates are contextually autoescaped to reduce the risk of XSS.

## Relationship between Metal.js and Soy

For the integration between Metal.js and soy to work, the soy files need to be compiled via one of our available build tools. That's because they don't just compile the code, but also add some information that help with the integration (like export declarations).

The available build tools that correctly compile soy for Metal.js are:

[gulp-metal](http://npmjs.com/package/gulp-metal) (already included when creating project via generator-metal).

[metal-cli](http://npmjs.com/package/metal-cli)

[metal-tools-soy](http://npmjs.com/package/metal-tools-soy)

## Register Soy Templates from Metal.js

The only thing you need to do to use soy templates in your Metal.js component is to call Soy.register, passing it your component class and the soy templates you're going to use, like this:

```javascript
import templates from './MyComponent.soy';
import Component from 'metal-component';
import Soy from 'metal-soy';

class MyComponent extends Component {
}
Soy.register(MyComponent, templates);

export default MyComponent;
```