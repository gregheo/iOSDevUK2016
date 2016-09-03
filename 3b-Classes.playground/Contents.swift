/*:
 ### iOSDevUK 2016 — Intermediate Swift
 
 This is the completed playground from part 3b on Classes, covering Grand Central Dispatch.
 */
import UIKit
import PlaygroundSupport
PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true

// Creating your own queue
let myQueue = DispatchQueue(label: "com.iosdevuk.myqueue")
myQueue.sync {
  print("Hello from my queue")
}

DispatchQueue.global(qos: .background).async {
  print("Hello from the background queue")
}

let item1 = DispatchWorkItem {
  print("1")
}

let item2 = DispatchWorkItem {
  print("2")
}

let item3 = DispatchWorkItem {
  print("3")
}

let now = DispatchTime.now()
DispatchQueue.global().async(execute: item1)
DispatchQueue.global().asyncAfter(deadline: now + 2, execute: item2)
DispatchQueue.global().asyncAfter(deadline: now + DispatchTimeInterval.milliseconds(2800), execute: item3)
item3.cancel()
item3.isCancelled

let globalWrapper: Void = {
  print("Inside the wrapper!")
}()

DispatchQueue.main.async { globalWrapper }
DispatchQueue.global().async { globalWrapper }
