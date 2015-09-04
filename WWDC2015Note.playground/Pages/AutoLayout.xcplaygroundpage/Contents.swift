import UIKit
import XCPlayground

func prepareViews() -> (UIView,UIView){
    let viewOut = UIView(frame: CGRectMake(0, 0, 200, 200))
    viewOut.translatesAutoresizingMaskIntoConstraints = false
    viewOut.backgroundColor = UIColor.redColor()
    
    let viewIn = UIView(frame: CGRectMake(0, 0, 10, 10))
    viewIn.translatesAutoresizingMaskIntoConstraints = false
    viewIn.backgroundColor = UIColor.purpleColor()
    viewOut.addSubview(viewIn)
    
    return (viewOut,viewIn)
}

@available(iOS 9.0, *)
func prepareLayoutGuides(view:UIView) -> (UILayoutGuide,UILayoutGuide){
    let leadGuide = UILayoutGuide()
    view.addLayoutGuide(leadGuide)
    
    let trailGuide = UILayoutGuide()
    view.addLayoutGuide(trailGuide)
    
    return (leadGuide,trailGuide)
}

@available(iOS 9.0, *)
func prepareConstraintGroup1(viewIn:UIView,viewOut:UIView,leadGuide:UILayoutGuide,trailGuide:UILayoutGuide) -> [NSLayoutConstraint] {
    let views = Dictionary(dictionaryLiteral: ("lead",leadGuide),("in",viewIn),("trail",trailGuide)) as [String:AnyObject]
    let constraintGroup1_1 = NSLayoutConstraint.constraintsWithVisualFormat("|[lead][in][trail]|", options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: views)
    
    let constraintGroup1_2:[NSLayoutConstraint] = [
        viewOut.anchor.height == viewIn.anchor.height,
        viewOut.anchor.height == leadGuide.anchor.height,
        viewOut.anchor.height == trailGuide.anchor.height,
        trailGuide.anchor.width == leadGuide.anchor.width * 0.5,
        trailGuide.anchor.width == viewIn.anchor.width
    ]
    
    return constraintGroup1_1 + constraintGroup1_2
}

@available(iOS 9.0, *)
func prepareConstraintGroup2(viewIn:UIView,viewOut:UIView) -> [NSLayoutConstraint] {
    return [
        viewIn.anchor.trailing == viewOut.anchor.trailing - 10,
        viewIn.anchor.bottom == viewOut.anchor.bottom - 10,
        viewIn.anchor.leading == viewOut.anchor.leading + 10,
        viewIn.anchor.top == viewOut.anchor.top + 10
    ]
}

if #available(iOS 9.0, *) {

    var (viewOut,viewIn) = prepareViews()
    var (leadGuide,trailGuide) = prepareLayoutGuides(viewOut)
    var constraintGroup1 = prepareConstraintGroup1(viewIn, viewOut: viewOut, leadGuide: leadGuide, trailGuide: trailGuide)
    var constraintGroup2 = prepareConstraintGroup2(viewIn, viewOut: viewOut)
    
/*:
    
Layout anchors are not available for margins

UIView now exposes layoutMarginsGuide

var layoutMarginsGuide: UILayoutGuide
    
*/
    viewOut.layoutMarginsGuide
    
    XCPShowView("YUME", view: viewOut)

    NSLayoutConstraint.activateConstraints(constraintGroup2)
    viewOut
    
    UIView.animateWithDuration(10, animations: { () -> Void in
        NSLayoutConstraint.deactivateConstraints(constraintGroup2)
        NSLayoutConstraint.activateConstraints(constraintGroup1)
        viewOut.layoutIfNeeded()
    })
    
    viewOut
    viewIn
    
}

//: [Next](@next)
