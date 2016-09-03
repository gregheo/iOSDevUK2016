/*:
 ### iOSDevUK 2016 — Intermediate Swift
 
 This is the completed playground from part 2a on Safety.
 */
import UIKit
import PlaygroundSupport

class PlaygroundViewController: UIViewController {
  var button: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.red

    button = UIButton(type: .roundedRect)
    
    // #selector!
    button.addTarget(self, action: #selector(PlaygroundViewController.buttonTapped(sender:)), for: .touchUpInside)
    
    button.setTitle("Hello iOSDevUK", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.center = CGPoint(x: 50, y: 50)
    button.sizeToFit()
    self.view.addSubview(button)
  }
  
  func buttonTapped(sender: UIButton) {
    print("button tapped!")
    self.view.backgroundColor = .brown
    
    // #keyPath!
    let kvcButton = self.value(forKeyPath: #keyPath(PlaygroundViewController.button))
    print("kvcButton: \(kvcButton)")
  }
}

PlaygroundPage.current.liveView = PlaygroundViewController()
