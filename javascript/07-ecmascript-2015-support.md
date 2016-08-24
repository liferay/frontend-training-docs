# ECMASCRIPT 2015 in Liferay Portal

**[ECMA-262 6th Edition, The ECMAScript 2015 Language Specification](http://www.ecma-international.org/ecma-262/6.0/)**

The current version of EcmaScript supported in modern browsers is ECMAScript 5.  The next version that has been released but is not yet supported is EXMAScript 2015, which is the 6th edition.

## What's new in ECMAScript 2015?

Some new features that have been introduced are:

- **Classes**, with constructors and inheritence! 
    ```javascript
    class Car {
        constructor(make) { //constructors!
            this.currentSpeed = 25;
        }

        printCurrentSpeed(){
              console.log('current speed: ' + this.currentSpeed + ' mph.');
        }
    }

    class RaceCar extends Car { //inheritance
        constructor(make, topSpeed) {
            super(make);
            this.topSpeed = topSpeed;
        }

        goFast(){
              this.currentSpeed = this.topSpeed;
        }
    }
    ```
- **Arrow Functions**, makes anonymous functions even easier
    ```javascript

    setTimeout(() => {
        alert("Hello from an arrow function!")
    }, 1000);
    ```
- **Modules**, load and manage dependencies via the new import and export keywords
    ```javascript
    
    import $ from 'lib/jquery';
    ```
- **let** and **const** declarations
    ```javascript
    //let
    function letTest() {
      let x = 1; // let declares a block scope local variable
      if (true) {
        let x = 2;  // different variable
        console.log(x);  // 2
      }
      console.log(x);  // 1
    }

    //const
    const ALWAYS_SEVEN = 7;

    // this will throw an error
    ALWAYS_SEVEN = 8;
    ```
- And much more!

## How can I use ECMAScript 2015 when modern browsers don't yet support it?

ES2015 code must be transpiled before it can be ran in the browser.  Luckily Liferay Portal 7 comes with this ability out of the box. To enable this process during your module build:

1. Files that contain ES2015 code that needs to be transpiled should end in `.es.js`.

2. In the `build.gradle` of the module, include the `transpileJs` task along with specifying certain properties designating patterns to match against source files.

    ```gradle
    transpileJS {
        srcIncludes = "**/*.es.js" //JavaScript files to transpile
        soySrcIncludes = "" //Soy files to transpile
    }
    ```

3. Then you can load your file the same way you normally would.  Check the slides for the Liferay AMD Module Loader for more information.