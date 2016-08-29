# Localization in Liferay Portal 7

Liferay makes it easy to support translation of your application into any language. The process involves creating 'language keys' that correspond to specific translations. These key/value pairs belong in language properties files.

## What are language properties files and how do I create them?

Language properties files are documents containing your language keys and translations. First it is necessary to create a default language properties file named `Language.properties`.  And for each language you'd like to support you will need an additional file that is named `Language_xx.properties`.  Where `xx` is the language abbreviation.

For example, if you'd like to support English, French, and Spanish in your application, you would have files named:

```
Language.properties
Language_fr.properties
Language_es.properties
```

## What locales are available by default?

There are a bunch of locales available by default in Liferay. Look in the portal.properties file file to find them.
```properties
locales=ar_SA,eu_ES,bg_BG,ca_AD,ca_ES,zh_CN,zh_TW,hr_HR,cs_CZ,da_DK,nl_NL,
    nl_BE,en_US,en_GB,en_AU,et_EE,fi_FI,fr_FR,fr_CA,gl_ES,de_DE,el_GR,
    iw_IL,hi_IN,hu_HU,in_ID,it_IT,ja_JP,ko_KR,lo_LA,lt_LT,nb_NO,fa_IR,
    pl_PL,pt_BR,pt_PT,ro_RO,ru_RU,sr_RS,sr_RS_latin,sl_SI,sk_SK,es_ES,
    sv_SE,tr_TR,uk_UA,vi_VN
```

## Where do language files go?

In an application with only one module that holds all your application’s views (for example, all its JSPs) and portlet components, just create a `src/main/resources/content` folder in that module, and place all of your `Language_xx.properties` there.

After that, make sure any portlet components (the `@Component` annotation in your -Portlet classes) in the module include this property:

```
"javax.portlet.resource-bundle=content.Language"
```

Providing translated language properties files and specifying the javax.portlet.resource-bundle property in your portlet component is all you need to do to have your language keys translated. Then, when the locale is changed in Liferay, your application’s language keys will be automatically translated.

## What do language files look like?

Language files follow the stander properties file format.  They should look something like:

```properties
hello=Hello
welcome-to-liferay=Welcome to Liferay
please-click-here-to-continue=Please click here to continue.
```

## How does automatically generating language files work?

Instead of manually creating a language properties file for each locale that’s supported by Liferay, you can get them all automatically generated for you with one command. The same command also propagates the keys from the default language file to all of the translation files. You can take a few additional steps and get automatic translations using Microsoft’s Translator API.

1. Make sure your module’s build includes the `com.liferay.lang.builder` [plugin](https://github.com/liferay/liferay-portal/tree/master/modules/sdk/gradle-plugins-lang-builder), by putting the plugin in build script classpath.

2. Make sure you have a default Language.properties file in `src/main/content`.

3. Run the gradle `buildLang` task from your project’s root directory to generate default translation files.

The generated files will contain automatic copies of all the keys and values in your default Language.properties files. That way you don’t have to worry about manually copying your lanugage keys into all of the files. Just run the `buildLang` task each time you change the default language file.

## How can translations be generated automatically?

If you'd like to use [Microsoft's Translator API](https://msdn.microsoft.com/en-us/library/hh454950), you must registor your app with Azure DataMarket.

1. Follow the instructions [here](https://msdn.microsoft.com/en-us/library/hh454950).

2. Make sure the `buildLang` task knows to use your credentials for translation. For security reasons you probably don’t want to pass them directly in your application’s build script.
```gradle
buildLang {
    translateClientId = "my-id"
    translateClientSecret = "my-secret"
} 
```

3.  Then when you run `buildLang`, translations will be automatically generated.

## How can I get the translations on the front end?

There is a liferay language object defined at `Liferay.Language`.  It contains all of the available locales, along with a `get` method that when passed a language key will return the translation in the current locale.

```javascript
Liferay.Language.get('click-here'); //returns "Click Here"
```