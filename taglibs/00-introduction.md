# Taglibs - Introduction

Taglibs are a tool to create consistent, resopnsive, accessible UI components for use in portlet development. Each taglib has their own series of attributes that are used to build components. Taglibs are good to use for future proof development, meaning that as the taglibs are updated through new patches and release versions, the taglibs used in a custom portlet will also be updated.

## Taglib Documentation

Documentation for taglibs can be found in TLD files [within the repo](https://github.com/liferay/liferay-portal/tree/master/util-taglib/src/META-INF) or through generated [java docs](https://docs.liferay.com/portal/7.0/taglibs/util-taglib/). The documentation informs developers of the attributes that can be used, the type of value that is accepted by the attribute, a description of the attribute, and whether or not the attribute is required.

## Using Taglibs in portlet

To use the various taglibs, make sure you include this in the `init.jsp` of the portlet

```html
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %><%@
taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>
```

From here it is possible to call the different taglibs using `<PREFIX:{tag-name} [TAG-ATTRIBUTES] />`, the other documentation will go more in depth on specific taglibs.