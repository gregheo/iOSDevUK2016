/*:
 ### iOSDevUK 2016 — Intermediate Swift
 
 This is the completed playground from part 3a on Classes, covering Core Graphics.
 */
import UIKit

// Slightly better way of drawing, taking advantage of CGContext as a class

let bounds = CGRect(x: 0, y: 0, width: 300, height: 200)
UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)

let path = UIBezierPath(ovalIn: bounds)

let context = UIGraphicsGetCurrentContext()!
context.setFillColor(UIColor.cyan.cgColor)
context.addPath(path.cgPath)
context.drawPath(using: .fill)

if let contextImage = context.makeImage() {
  let uiImage = UIImage(cgImage: contextImage)
}

UIGraphicsEndImageContext()


// The even better classy all-class way

let renderer = UIGraphicsImageRenderer(size: bounds.size)
let renderedImage = renderer.image { (renderContext) in
  let context = renderContext.cgContext
  
  context.setFillColor(UIColor.magenta.cgColor)
  context.addPath(path.cgPath)
  context.drawPath(using: .fill)
}

renderedImage
