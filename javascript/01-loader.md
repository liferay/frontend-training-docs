# Liferay AMD Module Loader

## What is the Liferay AMD Module Loader?

The [Liferay AMD Module Loader](https://www.npmjs.com/package/liferay-amd-loader) is a JavaScript file and module loader.

## What is a JavaScript module?

JavaScript modules are a way to encapsulate a piece of code into a useful unit that exports its' capability/value. This makes it easy for other modules to explicitly require this piece of code.  Structuring an application this way makes it easier to see the broader scope, easier to find what you're looking for, and keeps things related close together.

## What's the purpose of a module loader?

A normal web page usually loads JavaScript files via HTML `script` tags.  That's fine for small websites, but when developing large scale web applications, a better way to organize and load files is needed.  A module loader allows an application to load dependencies easily by just specifying a string that identifies the module name.

## How do you define a module?

The Liferay AMD Module loader works with JavaScript modules that are in the AMD format.  Here is a basic example of the definition an AMD module:

```javascript
define('aui-dialog', ['aui-node', 'aui-plugin-base'], function(node, pluginBase) {
    return {
        log: function(text) {
            console.log('module aui-dialog: ' + text);
        }
    };
});
```

You may specify that the module should be loaded on triggering some other module and only of some condition is being met:

```javascript
define('aui-dialog', ['aui-node', 'aui-plugin-base'], function(node, pluginBase) {
    return {
        log: function(text) {
            console.log('module aui-dialog: ' + text);
        }
    };
}, {
    condition: {
        trigger: 'aui-test',
        test: function() {
            var el = document.createElement('input');

            return ('placeholder' in el);
        }
    },
    path: 'aui-dialog.js'
});
```

Here it is specified, that this module should be loaded automatically if developer requests 'aui-test' module, but only if some condition is being met.

## How do you load a module?

It's as easy as passing the module name to the `require` method.

```javascript
require('aui-dialog', function(base, test) {
    // your code here
}, function(error) {
    console.error(error);
});
```

## Mapping module names

You can map module names to specifc versions or other naming conventions.

```javascript
__CONFIG__.maps = {
    'liferay': 'liferay@1.0.0',
    'liferay2': 'liferay@1.0.0'
};
```

Mapping a module will change its name in order to match the value, specified in the map.

```javascript
require('liferay/html/js/autocomplete'...)
```

Under the hood, this will be the same as:

```javascript
require('liferay@1.0.0/html/js/autocomplete'...)
```

## How is the loader used in Liferay Portal 7?

Tools, like the [Liferay AMD Module Config Generator](https://www.npmjs.com/package/liferay-module-config-generator),  have been integrated into the portal to make it easy for developers to create and load modules. An outline of the process is as follows:

1. This tool scans your code and looks for amd modules `define(...)` statements.

2. It will then name the module, if it is not named already.

3. It takes note of that information, as well as the listed dependencies, and also any other configurations specified.  The configuration options are listed below:

```
  Usage: lfr-cfgen [options] <file ...>

  Options:

    -h, --help                                   output usage information
    -b, --base [file name]                       Already existing template to be used as base for the parsed configuration
    -c, --config [config variable]               The configuration variable to which the modules should be added. Default: __CONFIG__
    -e, --extension [module extension]           Use the provided string as an extension instead to get it automatically from the file name. Default: ""
    -f, --format [module format]                 Regex and value which will be applied to the file name when generating the module name. Example: "/_/g,-". Default: ""
    -i, --ignorePath [ignore path]               Do not create module path and fullPath properties.
    -k, --keepExtension [keep file extension]    If true, will keep the file extension when it generates module name. Default: false
    -l, --lowerCase [lower case]                 Convert file name to lower case before to use it as module name. Default: false
    -m, --moduleConfig [module configuration]    JSON file which contains configuration data for the modules, for example module prefix
    -o, --output [file name]                     Output file to store the generated configuration
    -p, --filePattern [file pattern]             The pattern to be used in order to find files for processing. Default: "**/*.js"
    -r, --moduleRoot [module root]               The folder which will be used as starting point from which the module name should be generated. Default: current working directory
    -s, --skipFileOverride [skip file override]  Do not overwrite module file if name is auto generated.
    -V, --version                                output the version number
```

And then creates a config.json file that may look something like this

```json
{
    "frontend-js-web@1.0.0/html/js/parser": {
        "dependencies": []
    },
    "frontend-js-web@1.0.0/html/js/list-display": {
        "dependencies": ["exports"]
    },
    "frontend-js-web@1.0.0/html/js/autocomplete": {
        "dependencies": ["exports", "./parser", "./list-display"]
    }
}
```

You can see another exmaple in portal here: `modules/apps/foundation/frontend-js/frontend-js-metal-web/.task-cache/config.json`.

This configuration object tells the loader which modules are available, where they are, and what dependencies they will require.