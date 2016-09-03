/*:
 ### iOSDevUK 2016 — Intermediate Swift
 
 This is the completed playground from part 1 on Playgrounds.
 */
import UIKit
import PlaygroundSupport

// View
let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
myView.backgroundColor = UIColor.orange

// View controller
class PlaygroundViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.red
    
    let button = UIButton(type: .roundedRect)
    button.setTitle("Hello iOSDevUK", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.center = CGPoint(x: 50, y: 50)
    button.sizeToFit()
    self.view.addSubview(button)
  }
}

PlaygroundPage.current.liveView = PlaygroundViewController()

// Making colours "live viewable"
extension UIColor: PlaygroundLiveViewable {
  public var playgroundLiveViewRepresentation: PlaygroundLiveViewRepresentation {
    let colourView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    colourView.backgroundColor = self
    
    return .view(colourView)
  }
}

PlaygroundPage.current.liveView = UIColor.blue
