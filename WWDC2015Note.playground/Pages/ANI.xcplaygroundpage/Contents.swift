import UIKit
import XCPlayground

var view = UILabel(frame: CGRectMake(0, 0, 100, 50))
view.text = "abcd"
view.backgroundColor = UIColor.yellowColor()

XCPShowView("View", view: view)

let gradient = CAGradientLayer()
gradient.frame = view.bounds
gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
gradient.endPoint = CGPoint(x: 1.0, y: 1.0)

gradient.colors = [
    UIColor(red: 0.0, green: 1.0, blue: 0.752, alpha: 1.0).CGColor,
    UIColor(red: 0.949, green: 0.03, blue: 0.913, alpha: 1.0).CGColor
]
view.layer.addSublayer(gradient)
view


//: [Previous](@previous) | [Next](@next)
