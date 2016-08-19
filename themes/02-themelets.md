# Themelets

## What's a Themelet?

Themelets are small, extendable, and reusable pieces of code that are implmented by a theme. They can consist of css, templates, images, and javascript just like a theme.

They exist as [npm](https://www.npmjs.com/) packages and can be published to the npm registry for easy sharing and reuse.

The benefit of themelets is that it allows you to share pieces of code between themes, cutting down on boilerplate and repetition.

## Creating a Themelet

The themelet generator is packaged with the `generator-liferay-theme` npm package.

```
yo liferay-theme:themelet
```

The generator will prompt you for a themelet name and version of Liferay Portal just like the theme generator, but unlike the theme generator no npm dependencies will be installed as themelets only consist of static files and cannot be deployed as stand alone plugins.

## Themelet Structure

File                     | Description
:----------------------- | :---------------------------------------------------------
``src``                  | Contains src files of themelet.
``src/css/_custom.scss`` | Contains themelet styles that get automatically injected to theme on theme build.
``package.json``         | Where themelet meta-data is defined.

The `src` directory is where all themelet files exist that will eventually be used by a theme. For example, if you want to add javascript to your themelet you simply need to create `src/js/main.js`.

> Note: a themelet can have multiple js files, any file ending with a .js file extension in `src/js` will automatically be injected into a theme during build.

For non css and js files, they will be made available in the built theme files. Let's say `my-themelet` has the following file.

```
src/images/icon.png
```

This file will be available in the built theme at...

```
{theme-path}/themelets/my-cool-themelet/images/icon.png
```

## Adding a Themelet to a Theme

### Making Themelet Available

There are two ways to make a themelet available to a theme.

1. Install your themelet as a global npm module (for development purposes only)
2. Publish your themelet to the npm registry

To install your themelet as a global npm module you can run either `npm link` or `npm install -g` from the root of the themelet.

> Note: `npm link` will create a symlink in the global npm module directory. `npm install -g` will copy the files, meaning if you use this method you will have to re-run `npm install -g` to make any changes to your themelet available.

### Gulp Extend Task

After making your themelet globally available, simply run the `extend` task from your theme.

```
gulp extend
```

A series of prompts will follow, select `Themelet > Search globally installed npm modules`. Any globally installed themelets should show up in the list, select the themelet(s) you want with the spacebar, once you are done selecting press enter.

The themelets will now be added as npm dependencies to your theme.

### Gulp Build Task

The final step is building and deploying your theme. Themelet css and js files will automatically be injected into your theme during the `build` task.

Themelet css will be injected via scss imports into the theme's _custom.scss file wherever the following css comment exists.

```css
/* inject:imports */
/* endinject */
```

Themelet js will be injected via `<script>` tags into the theme's portal_normal template wherever the following html comment exists.

```html
<!-- inject:js -->
<!-- endinject -->
```

These comments can be moved anywhere in the files they reside in. If you remove these comments the themelet resources in questions will not be added during the build.

> Note: the `build` task is also run during the `deploy` and `deploy:gogo` tasks, so themelet files will also be injected during deploy.
