import UIKit
import XCPlayground

if #available(iOS 9.0, *) {

    var viewOut = UIView(frame: CGRectMake(0, 0, 200, 200))
    viewOut.translatesAutoresizingMaskIntoConstraints = false
//    viewOut.accessibilityIdentifier = "ViewOUT"
    viewOut.backgroundColor = UIColor.redColor()
    
    var viewIn = UIView(frame: CGRectMake(0, 0, 10, 10))
    viewIn.translatesAutoresizingMaskIntoConstraints = false
//    viewIn.accessibilityIdentifier = "ViewIN"
    viewIn.backgroundColor = UIColor.purpleColor()
    viewOut.addSubview(viewIn)
    
    var leadGuide = UILayoutGuide()
    viewOut.addLayoutGuide(leadGuide)
    
    var trailGuide = UILayoutGuide()
    viewOut.addLayoutGuide(trailGuide)
    
    XCPShowView("YUME", view: viewOut)

    var views = Dictionary(dictionaryLiteral: ("lead",leadGuide),("in",viewIn),("trail",trailGuide)) as [String:AnyObject]
    var constraintGroup1_1 = NSLayoutConstraint.constraintsWithVisualFormat("|[lead][in][trail]|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: views)
    
    var constraintGroup1_2:[NSLayoutConstraint] = [
        viewOut.anchor.height == viewIn.anchor.height,
        viewOut.anchor.height == leadGuide.anchor.height,
        viewOut.anchor.height == trailGuide.anchor.height,
        trailGuide.anchor.width == leadGuide.anchor.width * 0.5,
        trailGuide.anchor.width == viewIn.anchor.width
    ]
    
    var constraintGroup1 = constraintGroup1_1 + constraintGroup1_2
    
    var constraintGroup2:[NSLayoutConstraint] = [
        viewIn.anchor.trailing == viewOut.anchor.trailing - 10,
        viewIn.anchor.bottom == viewOut.anchor.bottom - 10,
        viewIn.anchor.leading == viewOut.anchor.leading + 10,
        viewIn.anchor.top == viewOut.anchor.top + 10
    ]
    
    NSLayoutConstraint.activateConstraints(constraintGroup2)
    viewOut
    

    
    UIView.animateWithDuration(10, animations: { () -> Void in
        NSLayoutConstraint.deactivateConstraints(constraintGroup2)
        NSLayoutConstraint.activateConstraints(constraintGroup1)
        viewOut.layoutIfNeeded()
    })
    
    viewOut
    viewIn
    
    print(viewOut.valueForKey("autolayoutTrace"))
    
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
    
    
    var kk:NSLayoutAnchor = viewOut.topAnchor

}

//: [Next](@next)
