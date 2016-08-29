# Alloy Editor in Liferay Portal 7

![](images/14-alloy-editor_demo.png)

## What is Alloy Editor?

It is a modern "What you see is what you get" editor built on top of the famous CKEditor, designed to create modern and gorgeous web content.

## What makes Alloy Editor different?

Editing Web Content without using iframe is not something new these days. However, the toolbar of the most editors appears on top or on bottom of the container. Wouldn't it be better to provide a modern UI, but still have all the benefits of using CKEditor?

That's where Alloy Editor comes in.  It provides a UI that provides context toolbars, which change their appearance depending on the selected element - image or text. A UI which also allows developers to add or remove buttons to these toolbars on the fly.

![](images/14-alloy-editor_toolbar.png)

AlloyEditor also offers plugins that can do some really impressive things.  Such as allowing Drag&Drop of images directly in the editor. adding placeholders that work just as the standard placeholder HTML5 attribute.

## What is Alloy Editor used for?

Lots of things!  In Liferay Portal 7, you can use Alloy Editor to create web content, blog posts, announcements, and much more.  Alloy Editor is flexible and configurable enough to do any job CKEditor can, plus more!

## How do I use Alloy Editor in my portal instance?

Creating an Alloy Editor instance is as easy as including alloy editor and calling the `editable` static method like so:

```javascript
AlloyEditor.editable('myContentEditable');
```

But in portal, there is an even easier way.  You can use the Liferay UI Input Editor taglib in your JSP. It would look something like:

```jsp
<liferay-ui:input-editor contents="<%= content %>" editorName="alloyeditor" name="myAlloyEditor" placeholder="caption" showSource="<%= false %>" />
```
Notice the `editorName` attribute is set to `alloyeditor`.

## Which browsers support Alloy Editor?

AlloyEditor runs on IE9+, Chrome, Firefox and Safari.

## Who created AlloyEditor?

The project was been created by [Iliyan Peychev](https://twitter.com/ipeychev) and has been contributed to by many other brilliant developers.


<a href="https://github.com/ipeychev">
    <img src="https://avatars.githubusercontent.com/u/78014?v=3" width="100">
</a>
<a href="https://github.com/jbalsas">
    <img src="https://avatars.githubusercontent.com/u/905006?v=3" width="100">
</a><a href="https://github.com/antoniopol06">
    <img src="https://avatars.githubusercontent.com/u/3017821?v=3" width="100">
</a><a href="https://github.com/ambrinchaudhary">
    <img src="https://avatars.githubusercontent.com/u/8373764?v=3" width="100">
</a><a href="https://github.com/dpobel">
    <img src="https://avatars.githubusercontent.com/u/305563?v=3" width="100">
</a><a href="https://github.com/mattleff">
    <img src="https://avatars.githubusercontent.com/u/120155?v=3" width="100">
</a><a href="https://github.com/kushal">
    <img src="https://avatars.githubusercontent.com/u/109492?v=3" width="100">
</a><a href="https://github.com/Bjarno">
    <img src="https://avatars.githubusercontent.com/u/6963292?v=3" width="100">
</a><a href="https://github.com/dandv">
    <img src="https://avatars.githubusercontent.com/u/33569?v=3" width="100">
</a><a href="https://github.com/dantman">
    <img src="https://avatars.githubusercontent.com/u/53399?v=3" width="100">
</a><a href="https://github.com/eduardolundgren">
    <img src="https://avatars.githubusercontent.com/u/113087?v=3" width="100">
</a><a href="https://github.com/emilecantin">
    <img src="https://avatars.githubusercontent.com/u/885486?v=3" width="100">
</a><a href="https://github.com/gerad">
    <img src="https://avatars.githubusercontent.com/u/27563?v=3" width="100">
</a><a href="https://github.com/jssisodiyaPG">
    <img src="https://avatars.githubusercontent.com/u/11207707?v=3" width="100">
</a><a href="https://github.com/julianwachholz">
    <img src="https://avatars.githubusercontent.com/u/519966?v=3" width="100">
</a></div>