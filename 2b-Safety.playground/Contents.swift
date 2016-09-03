/*:
 ### iOSDevUK 2016 — Intermediate Swift
 
 This is the completed playground from part 2b on Safety (closures).
 */
import UIKit

class OperationsService {
  var queuedClosures: [() -> Void] = []

  func performOperation(closure: () -> Void) {
    closure()
  }
  
  func enqueueOperation(closure: @escaping () -> Void) {
    queuedClosures.append(closure)
  }
  
  func performQueuedOperations() {
    for closure in queuedClosures {
      closure()
    }
    
    queuedClosures = []
  }
}

class ViewController {
  let operations = OperationsService()
  var counter = 1
  
  func testOperation() {
    operations.performOperation {
      print("Hello")
      // whoa, no self. required!
      counter += 1
    }
    
    operations.enqueueOperation {
      print("I was enqueued!")
      self.counter += 1
    }
    
    operations.enqueueOperation {
      print("I was also enqueued")
      self.counter += 1
    }
    
    operations.performQueuedOperations()
  }
}

let vc = ViewController()
vc.testOperation()

print("Counter is at \(vc.counter)")

