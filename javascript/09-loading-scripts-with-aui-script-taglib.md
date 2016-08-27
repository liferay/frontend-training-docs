# Loading Scripts with the AUI Script tag in Liferay Portal 7

## What is the AUI Script tag?

The AUI script tag is a taglib for JSPs that allows you to load JavaScript in script tags on the page and ensure certain resources are loaded before executing.

## How is it used?

It looks something like:

```jsp
    <aui:script use="aui-base">
        A.one('#someNodeId').on(
            'click',
            function(event) {
                alert('Thank you for clicking.')
            }
        );
    </aui:script>
```

This will load the `aui-base` AlloyUI component and make it available to the code inside the `aui:script`.

You can also load AMD modules by using the `require` attribute, like this:

```jsp
    <aui:script require="metal-clipboard/src/Clipboard">
        new metalClipboardSrcClipboard.default();
    </aui:script>
```

## What options are there?

- **require**: Requires an AMD module that will be loaded with the [Liferay AMD Module Loader](https://www.npmjs.com/package/liferay-amd-loader).
- **use**: Uses an AlloyUI/YUI module that will be loaded via the YUI loader
- **position**: The position the script tag is put in the page.  Can be `inline` or `auto`.
- **sandbox**: If set to true, it will wrap the script tag in an anonymous function.  Also, `$` and `_` will be defined for jQuery and underscore.

## What will these scripts end up looking like on the page?

### Using the `use` attribute:

```html
<script type="text/javascript">
    AUI().use("aui-base",
        function(a){
            A.one('#someNodeId').on(
                'click',
                function(event) {
                    alert('Thank you for clicking.')
                }
            );
        }
    );
</script>
```

### Using the `require` attribute:

```html
<script type="text/javascript">
    require("metal-clipboard/src/Clipboard", function(metalClipboardSrcClipboard) {
        (function() {
            new metalClipboardSrcClipboard.default();
        })()
    }, function(a) {
        console.error(a)
    });
</script>
```