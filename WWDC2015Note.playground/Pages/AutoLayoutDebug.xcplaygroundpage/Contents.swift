import UIKit
import XCPlayground

func prepareViews() -> (UIView,UIView){
    let viewOut = UIView(frame: CGRectMake(0, 0, 200, 200))
    viewOut.accessibilityIdentifier = "ViewOut"
    viewOut.translatesAutoresizingMaskIntoConstraints = false
    viewOut.backgroundColor = UIColor.redColor()
    
    let viewIn = UIView(frame: CGRectMake(0, 0, 10, 10))
    viewIn.accessibilityIdentifier = "ViewIn"
    viewIn.translatesAutoresizingMaskIntoConstraints = false
    viewIn.backgroundColor = UIColor.purpleColor()
    viewOut.addSubview(viewIn)
    
    return (viewOut,viewIn)
}

if #available(iOS 9.0, *) {
    var (viewOut,viewIn) = prepareViews()
    var constraintGroup1:[NSLayoutConstraint] = [
        viewIn.anchor.leading == viewOut.anchor.leading + 20,
        viewIn.anchor.leading == viewOut.anchor.leading + 10,
        viewIn.anchor.trailing == viewOut.anchor.trailing - 10,
        viewIn.anchor.top == viewOut.anchor.top + 10,
        viewIn.anchor.bottom == viewOut.anchor.bottom - 10
    ]

//: Debug info
    
    for constraint in constraintGroup1 {
        constraint.identifier = "ConstraintGroup1"
    }
    
    XCPShowView("YUME", view: viewOut)
//: Ambiguity
    print(
        viewOut.hasAmbiguousLayout() ?
        "Have AmbiguousLayout Now" :
        "All Clear"
    )
    print("----- Make Ambiguity Layout Start -----")
    NSLayoutConstraint.activateConstraints(constraintGroup1)
    print("------ Make Ambiguity Layout End ------\n")
    
//: [constraint _autolayoutTrace];
    print("trace --------------------------------------------------------------------")
    print(viewOut.valueForKey("autolayoutTrace"))
    
//: View one axis at a time
    var verticalContraints = viewOut.constraintsAffectingLayoutForAxis(UILayoutConstraintAxis.Vertical)
    for constraint in verticalContraints {
        print(constraint.description)
    }
    var horizontalContraints = viewOut.constraintsAffectingLayoutForAxis(UILayoutConstraintAxis.Horizontal)
    for constraint in horizontalContraints {
        print(constraint.description)
        print(constraint)
    }
    
}

/*:
###Ambiguity

`_autolayoutTrace`

Debug > View Debugging > Show Alignment Rectangles

`exerciseAmbiguityInLayout`
*/



//: [Previous](@previous) | [Next](@next)







// viewOut.autolayoutTrace
//: Engine recomputes the layout
//:
//: Engine variables receive new values
//:
//: Views call `superview.setNeedsLayout()`
