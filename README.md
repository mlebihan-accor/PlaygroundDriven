## PlaygroundDriven

Quickly set up a view. Get instant feedback on its styling. Inspired by [KickStarter](https://github.com/kickstarter) development tools. 

First commit written with Xcode 12.4 and swift 5.3.2.



## Why PlaygroundDriven?

If you need to iterate on views styles while working with UI/UX designers and POs, trying different rendering on the fly, if you need to make decisions and easily compare different options on styling, if you need to see how different data impact your UI and UX design, then this tool will prove useful.

No need to run your app, go to a particular screen, take a snapshot, make a change, run the app, go to the screen again and take a snapshot. No need to repeat this as much as necessary to collect meaningful information, share your  screenshots, get feedback, go back to this cycle again until you and your teammates can make a decision. 

PlaygroundDriven lets you get instant UI feedback and make informed decisions faster.



## How to use PlaygroundDriven?

Download the project. Open it with Xcode.

Go to the `CompositionField` page and run the playground. You should see a view, the form factor of an iphone, with labels.



#### Play with CompositionField

Use Xcode Playground to check dynamic type behavior over different size classes, preferred font sizes and screen sizes.

+ Set the Playground to automatically run.

+ Go to `MyPlayground/CompositionField`. It's where you can set up the rendering: 

+ Choose a device
+ Change orientation
+ Modify content size category

+ Go to `CompositionField/ViewController` and add or delete labels, change their texts or status, modify spacings, etc.
+ Go to `CompositionField/CompositionField`. It's where the basic view is set up. The basic view is a label, an interactive textField and a message. Play with these elements styles. Create your own!
+ Go to `CompositionField/Sources/PlaygroundHelper` to add iDevices, with their names, their screen sizes, traits and idiom. PlaygroundHelper creates a ViewController ready to be loaded in the playground rendering view.

*caveat: build `PlaygroundDriven` each time you make a change to your files in the framework, save the playground pages sources files after each modification to see the effect of any modification*



#### Use your own ViewControlller

+ Create a framework and embed your own View and/or ViewController, along with any files necessary to render your view.
+ Create your own playground page.
+ Instantiate your ViewController.
+ Instantiate a container and pass your ViewController instance as a `PlaygroundHelper` child. `PlaygroundHelper` will wrap your ViewController.
+ Assign the container to the Playground rendering view.
+ Enjoy!

