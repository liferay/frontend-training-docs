# Metal.js - JSX

## What is JSX?

JSX is an interesting alternative to templates developed by the team at Facebook.  It stands for JavaScript XML, and follows XML type element declaration for web component development. It is an inline markup that looks like HTML and gets transformed into JavaScript.  A JSX expression starts with an HTML-like open tag, and ends with the corresponding closing tag.

Some example JSX code:

```javascript
import JSXComponent from 'metal-jsx';

class Modal extends JSXComponent {
    render() {
        return <header class="modal-header">
                <button type="button" class="close">
                    <span>×</span>
                </button>
                <h4>{this.config.header}</h4>
            </header>;
    }
}

export default Modal;
```

## Why use JSX?

**Familiarity**: Developers are familiar with XML, and JSX provides a similar type of element declaration.

**Semantics**: JSX is easier to understand as it follows a declarative type of programming.

**Separation of concern**: JSX provides a clean way to encapsulate all the logic and markup in one definition.

## Relationship between Metal.js and JSX

The only thing you need to do to use JSX in your Metal.js component is to extend from **JSXComponent**, like this:

```javascript
import JSXComponent from 'metal-jsx';

class MyComponent extends JSXComponent {
}

export default MyComponent;
```

Now that we've extended from **JSXComponent** we can use jsx in the `render` method to specify what our component should render.

```javascript
import JSXComponent from 'metal-jsx';

class MyComponent extends JSXComponent {
    render() {
        return <div class={this.config.cssClass}>
            Hello {this.name}
        </div>;
    }
}

MyComponent.STATE = {
    name: {
        validator: core.isString,
        value: 'World'
    }
};

export default MyComponent;
```

## Rendering JSX

JSX components can either be rendered in the [usual way](http://metaljs.com/docs/rendering-components.html), or via the `JSXComponent.render` function, like this:

```javascript
JSXComponent.render(MyComponent, {name: 'my-component'}, parent);
```

## JSX Compilation

For the integration between Metal.js and JSX to work, the JSX code needs to be compiled via a babel plugin called [babel-plugin-incremental-dom](http://npmjs.com/package/babel-plugin-incremental-dom). Using it directly means you'd need to configure it manually though, so the Metal.js team also provide a [babel preset](http://npmjs.com/package/babel-preset-metal-jsx) that you can use instead.