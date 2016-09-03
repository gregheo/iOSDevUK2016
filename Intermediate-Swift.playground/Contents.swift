/*:
 # iOSDevUK 2016 — Intermediate Swift
 
 Thanks for attending the Intermediate Swift workshop! This playground is a summary of the concepts covered for your reference.
 
 If you have any questions or feedback, please get in touch; you can reach me as [@gregheo](https://twitter.com/gregheo) on Twitter or at [greg@gregheo.com](mailto:greg@gregheo.com) via email.
*/
import UIKit
//: Remember, you can access all kinds of playground-specific goodies with the `PlaygroundSupport` module. Both `UIView` and `UIViewController` conform to the `PlaygroundLiveViewable` protocol, which means they can be displayed right in the playground.
import PlaygroundSupport

//: To see the results of something right inline with the playground code, click the "See Results" button in the sidebar. Try it out with this lovely red view.
let redView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
redView.backgroundColor = .red

//: If you have a more substantial view controller or you don’t want the view inline, you can display it in the assistant editor by setting the playground's live view property.
PlaygroundPage.current.liveView = redView

//: Remember, live view controllers in the assistant view are fully interactive and great for protyping your interfaces. 

/*:
 ## Safety
 
 Safety is a continuing theme in Swift, from optionals to strong typing to more robust error handling.
 
 A common bug in Objective-C code comes from the use of stringly-typed parameters. Thanks to the dynamic nature of the Objective-C runtime, you can pass strings representing keys and selectors. That can be great for making decisions at run time, but that also means you lose the compile-time checking.

 Swift 3 introduces some new syntax for dealing with formerly stringly-typed things. Selectors in Swift used to be `StringLiteralConvertible` (now known as `ExpressibleByStringLiteral`), so you could use a plain String and work your way up.
 */
// This is a valid `Selector`
"viewDidLoad"

// This is an explicit `Selector`. In Swift 2, a lot of people didn’t bother and just went with the string.
Selector("viewDidLoad")

// New in Swift 3: #selector, which will be checked at compile time.
#selector(UIViewController.viewDidLoad)

/*:
 Similarly, `#keyPath` lets you refer to KVC-compliant properties in a safe, checked manner.
 */
#keyPath(UIView.backgroundColor)

/*:
 Note that the APIs themselves are unchanged and still expect strings! `#selector` and `#keyPath` are still generating strings; it’s just the compiler is checking them first.
 
 Take a look at the sidebar output at what the type of `someRandomKeypath` is reported as. You can also option-click on `someRandomKeypath` to see what type it is.
 */
let someRandomKeypath = #keyPath(UIColor.cgColor)
type(of: someRandomKeypath)

/*:
 ### Closures
 
 Remember, closures are objects that can be stored and passed around. When a closure expression is a parameter to a function, it used to be **escaping** by default, meaning closure could outlive the scope of the function. If the closure doesn’t escape the function body, you could annotate the parameter with `@noescape` in Swift 2.
 
 In Swift 3, this is now flipped around: closures are non-escaping by default, and you need to annotate them with `@escaping`.
 
 Check out the Swift evolution proposal for more details: [Make non-escaping closures the default](https://github.com/apple/swift-evolution/blob/master/proposals/0103-make-noescape-default.md)
 
 ### Access levels

 Who can access what?
 
 * `open` and `public`: anyone!
 * `internal`: inside the same module
 * `fileprivate`: inside the same file
 * `private`: inside the same { scope }

 `public` vs `open` makes a difference for classes: `public` classes are accessible but cannot be subclassed or have their methods overridden from outside the defining module. `open` classes don’t have this restriction and are completely accessible, subclassable, and method-overridable.

 ## Clarity & API Design
 
 Many of the APIs you know and love look very different in Swift 3. You can read all the details in the [swift.org API Design Guidelines](https://swift.org/documentation/api-design-guidelines/) or rely on the code completion and your own recognition ability.
 
 Generally, this means keeping the base method name short, and moving more verbiage into the parameter names. It also means many of the parameter names themselves are shorter! If you’re at all familiar with the existing APIs, this should be more of a temporary annoyance.
 
 ### Grand Central Dispatch
 
 One of the bigger changes in Swift 3 is to the Grand Central Dispatch (GCD) API. What used to be a C-based approach with opaque contexts and lots of functions is now a fully class-based API!
 
 **Dispatch queues** are represented by the `DispatchQueue` class. You can create your own queue, or access a global queue with the
 */
DispatchQueue(label: "com.test.myqueue").sync {
  // code for my custom queue goes here
}
DispatchQueue.main.async {
  // code for the main queue goes here
}
DispatchQueue.global(qos: .background).async {
  // background queue code goes here
}

/*:
 **Work items** are for collecting bits of code to be run repeatedly or scheduled. You can think of them as thin wrappers around closures for interacting with GCD in Swift, although most methods will accept both closures and work items.
 
 Work items can be created, run, scheduled, queued, and cancelled.
 */
let workItem = DispatchWorkItem {
  // code for the work item goes here
}

// run
workItem.perform()

// queue
DispatchQueue.main.async(execute: workItem)

// cancel; will never run in the future
workItem.cancel()

/*:
 Check out the Swift evolution proposal for more details on GCD in Swift: [Modernize libdispatch for Swift 3 naming conventions](https://github.com/apple/swift-evolution/blob/master/proposals/0088-libdispatch-for-swift3.md)
 */