# Introduction

From a high-level, themes in 7.0 haven't changed that much since 6.2. They are plugins made up of css, templates, images and javascript that modify the look and feel of Liferay Portal.

What has changed are the tools and libraries used in developing themes. Here is what we'll cover.

- Themes Generator
- Themelets
- Lexicon
- Lexicon Customizer
- Theme Contributors
- Importing Resources

## Themes Generator

The Themes Generator is a new tool for quick and easy development of Liferay themes. It consists of a Yeoman generator for quickly templating out a new theme project, and a set of Gulp tasks for building and deploying themes.

## Themelets

Themelets are small, extendable, and reusable pieces of code that are implemented by a theme. They can consist of css, templates, images, and javascript just like a theme.

They exist as npm packages and can be published to the npm registry for easy sharing and reuse.

## Lexicon

Lexicon is Liferay's frontend CSS framework, created to unify the user interface across 7.0. It provides the core CSS resources necessary to create a consistent UI across Liferay Portal's web platform. Based on Bootstrap 3, it also serves as a gateway for customizing Liferay Portal's frontend through third party themes or your own custom theme.

## Lexicon Customizer

Lexicon Customizer is a desktop application intended for customizing Bootstrap and Lexicon scss variables for modifying the look and feel of Bootstrap and Lexicon components.

## Theme Contributors

Theme Contributors provide a way to package UI resources independent of a theme and include them on the page. There are theme contributors that come packaged out of the box in Portal.  These consist of UI resources that style the Product Menu, Control Menu, and Simulation Menu.

## Importing Resources

The Resources Importer allows developers to deploy their themes with predefined content. This is useful for showcasing a theme, and also provides a site template which can be used for creating new sites with a predefined look and feel.
