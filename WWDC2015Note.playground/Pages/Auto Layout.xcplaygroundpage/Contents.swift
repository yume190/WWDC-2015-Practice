import UIKit
import XCPlayground

var viewOut = UIView(frame: CGRectMake(0, 0, 200, 200))
viewOut.translatesAutoresizingMaskIntoConstraints = false
viewOut.backgroundColor = UIColor.redColor()


var viewIn = UIView(frame: CGRectMake(0, 0, 10, 10))
viewIn.translatesAutoresizingMaskIntoConstraints = false
viewIn.backgroundColor = UIColor.purpleColor()

var leadGuide = UILayoutGuide()
viewOut.addLayoutGuide(leadGuide)

var trailGuide = UILayoutGuide()
viewOut.addLayoutGuide(trailGuide)


//var vc = UIViewController()
//vc.view.addSubview(viewOut)
//XCPShowView("VC", view: vc.view)

viewOut.addSubview(viewIn)


var views = Dictionary(dictionaryLiteral: ("lead",leadGuide),("in",viewIn),("trail",trailGuide)) as [String:AnyObject]
var cs1 = NSLayoutConstraint.constraintsWithVisualFormat("|[lead][in][trail]|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: views)

var c1 = viewOut.heightAnchor.constraintEqualToAnchor(viewIn.heightAnchor)
var c2 = viewOut.heightAnchor.constraintEqualToAnchor(leadGuide.heightAnchor)
var c3 = viewOut.heightAnchor.constraintEqualToAnchor(trailGuide.heightAnchor)
var c4 = trailGuide.widthAnchor.constraintEqualToAnchor(leadGuide.widthAnchor, multiplier: 0.5)
var c5 = trailGuide.widthAnchor.constraintEqualToAnchor(viewIn.widthAnchor)
cs1.append(c1)
cs1.append(c2)
cs1.append(c3)
cs1.append(c4)
cs1.append(c5)

var cc1 = viewIn.trailingAnchor.constraintEqualToAnchor(viewOut.trailingAnchor, constant: -10)
var cc2 = viewIn.bottomAnchor.constraintEqualToAnchor(viewOut.bottomAnchor, constant: -10)
var cc3 = viewIn.leadingAnchor.constraintEqualToAnchor(viewOut.leadingAnchor, constant: 10)
var cc4 = viewIn.topAnchor.constraintEqualToAnchor(viewOut.topAnchor, constant: 10)
var cs2 = [cc1,cc2,cc3,cc4] as [NSLayoutConstraint]

NSLayoutConstraint.activateConstraints(cs1)
viewOut.layoutIfNeeded()
viewIn.layoutIfNeeded()
viewOut

NSLayoutConstraint.deactivateConstraints(cs1)
NSLayoutConstraint.activateConstraints(cs2)
viewOut.layoutIfNeeded()
viewIn.layoutIfNeeded()
viewOut

//: Debug info

var constraint1 = viewOut.heightAnchor.constraintEqualToAnchor(viewIn.heightAnchor)
XCPCaptureValue("constrain", value: constraint1.description)
print(constraint1.description)
constraint1.identifier = "c1"
XCPCaptureValue("constrain", value: constraint1.description)
print(constraint1.description)
viewIn.accessibilityIdentifier = "viewIn"
XCPCaptureValue("constrain", value: constraint1.description)
print(constraint1.description)
viewOut.accessibilityIdentifier = "viewOut"
XCPCaptureValue("constrain", value: constraint1.description)
print(constraint1.description)

//: [Next](@next)
