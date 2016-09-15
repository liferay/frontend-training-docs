# Theme Contributors

## What is a Theme Contributor?

### Key Points
- A Theme Contributor is a module that contains UI resources to use in Liferay 7 and DXP.
- The module is scanned for all valid CSS and JS files.
- The resources are then included on all pages, regardless of the theme.
- If you'd like to package UI resources, independent of a specific theme, and include them on all pages, Theme Contributors are the tool for you.

## Identifying existing Theme Contributor modules

### Key Points
- In Liferay versions prior to 7.0, the standard UI for User menus and navigation, such as the Dockbar, was included in the theme template.
- Starting in Liferay 7.0, these standard UI components are packaged as Theme Contributors.
- Specifically: the Control Menu, the Product Menu, and the Simulation Panel; are now Theme Contributor modules.
- Styles for these specific UI components can be handled outside of the theme.

![Screenshot highlighting: the Control Menu, the Product Menu, and the Simulation Panel; as Theme Contributor modules](images/07-theme-contributors_menus-diagram.png)

## Modifying Standard Theme Contributors

### Key Points
- If you want to edit or style standard Theme Contributors, you'll need to modify the module directly and rebuild it.
- To edit a Theme Contributor UI component, for instance to style one, follow these steps:
    1. Open the Command Line and navigate to the Theme Contributor module.

    For instance, the Product Menu Theme Contributor module resides in the following directory:

    `liferay-portal/modules/apps/web-experience/product-navigation/product-navigation-product-menu-theme-contributor`
    2. Navigate to the directory: `src/main/resources/META-INF/resources`; under the module and edit the file you want to update.
    3. Save the file and navigate back to the module's root directory.
    4. Run `../../../../../gradlew deploy` to build and deploy the updated `jar` file.

## Creating Your Own Theme Contributor

### Key Points
- As mentioned earlier, Theme Contributors are simply packaged UI components.
- To identify your module as a Theme Contributor add the property: `Liferay-Theme-Contributor-Type`;  to your `bnd.bnd` file.
- For example, the Control Menu Theme Contributor has the following configuration:

    ```
    Bundle-Name: Liferay Product Navigation Control Menu Theme Contributor
    Bundle-SymbolicName: com.liferay.product.navigation.control.menu.theme.contributor
    Bundle-Version: 1.0.0
    Liferay-Releng-Module-Group-Description:
    Liferay-Releng-Module-Group-Title: Product Navigation
    Liferay-Theme-Contributor-Type: product-navigation-control-menu
    Web-ContextPath: /product-navigation-control-menu-theme-contributor
    -include: ../../../../../marketplace/web-content-management/bnd.bnd
    ```

- That's all you need to do to create a Theme Contributor for your site.

Remember, "with great power comes great responsibility", so use Theme Contributors wisely. The UI contributions will affect every page, and will remain, regardless of the theme.