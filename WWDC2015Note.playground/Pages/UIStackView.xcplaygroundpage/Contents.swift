import UIKit
import XCPlayground

var view1 = UIView(frame: CGRectMake(0, 0, 10, 10))
view1.backgroundColor = UIColor.purpleColor()
var view2 = UIView(frame: CGRectMake(0, 0, 20, 20))
view2.backgroundColor = UIColor.yellowColor()
var view3 = UIView(frame: CGRectMake(0, 0, 30, 30))
view3.backgroundColor = UIColor.redColor()
var view4 = UIView(frame: CGRectMake(0, 0, 40, 40))
view4.backgroundColor = UIColor.greenColor()
var view5 = UIView(frame: CGRectMake(0, 0, 50, 50))
view5.backgroundColor = UIColor.blueColor()

var stack = UIStackView(frame: CGRectMake(0, 0, 300, 300))
stack.backgroundColor = UIColor.brownColor()

stack.addArrangedSubview(view1)
stack.addArrangedSubview(view2)
stack.addArrangedSubview(view3)
stack.addArrangedSubview(view4)
stack.addArrangedSubview(view5)

XCPShowView("Yume", view: stack)

stack.axis = UILayoutConstraintAxis.Horizontal
stack.alignment = UIStackViewAlignment.Fill
stack.distribution = UIStackViewDistribution.FillProportionally
stack.layoutMarginsRelativeArrangement = true
stack.translatesAutoresizingMaskIntoConstraints = false


//UIView.animateWithDuration(10, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//    stack.axis = UILayoutConstraintAxis.Vertical
//    stack.distribution = UIStackViewDistribution.FillEqually
//    stack.layoutIfNeeded()
//    }, completion: nil)

UIView.animateWithDuration(10) { () -> Void in
    stack.axis = UILayoutConstraintAxis.Vertical
    stack.distribution = UIStackViewDistribution.FillEqually
    stack.layoutIfNeeded()
}


//UIView.animateWithDuration(10, delay: 10, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//    stack.distribution = UIStackViewDistribution.EqualCentering
//    stack.layoutIfNeeded()
//    }, completion: nil)
//
//UIView.animateWithDuration(10, delay: 20, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//    stack.distribution = UIStackViewDistribution.EqualSpacing
//    stack.layoutIfNeeded()
//    }, completion: nil)
//
//UIView.animateWithDuration(10, delay: 30, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
//    stack.distribution = UIStackViewDistribution.Fill
//    }, completion: nil)










var axis: UILayoutConstraintAxis
var distribution: UIStackViewDistribution
var alignment: UIStackViewAlignment
var spacing: CGFloat
var baselineRelativeArrangement: Bool
var layoutMarginsRelativeArrangement: Bool



//: [Previous](@previous)
