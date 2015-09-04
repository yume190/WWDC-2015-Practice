import UIKit
import XCPlayground

if #available(iOS 9.0, *) {
    var tag1 = UILabel(frame: CGRectMake(0, 0, 100, 50))
    tag1.text = "text"
    tag1.theme = theme.label.TAG_ARRIVAL
    
    
    var tag2 = UILabel(frame: CGRectMake(0, 0, 200, 50))
    tag2.text = "text"
    tag2.theme = theme.label.TAG_NO_BUS
    
    var tag3 = UILabel(frame: CGRectMake(0, 0, 300, 50))
    tag3.text = "text"
    tag3.theme = theme.label.TAG_TIME_TABLE
    
    var tag4 = UILabel(frame: CGRectMake(0, 0, 100, 100))
    tag4.text = "text"
    tag4.theme = theme.label.TAG_WAIT_SOON
    
    var stack = UIStackView(arrangedSubviews: [
        tag1,
        tag2,
        tag3,
        tag4
        ])
    stack.frame = CGRectMake(0, 0, 400, 400)
    stack.axis = UILayoutConstraintAxis.Vertical
    stack.alignment = UIStackViewAlignment.Fill
    stack.distribution = UIStackViewDistribution.EqualSpacing
    stack.layoutMarginsRelativeArrangement = true
    stack.translatesAutoresizingMaskIntoConstraints = false
    
    XCPShowView("Stack", view: stack)
    
    var label1 = UILabel(frame: CGRectMake(0,0,100,100))
    label1.text = "abc"
    label1.textColor = UIColor.whiteColor()
    label1.layer.cornerRadius = 4
    label1.textAlignment = .Center
    label1.clipsToBounds = true
    label1.backgroundColor = UIColor(rgb: 0xF54C08)
    
    var label2 = UILabel(frame: CGRectMake(0,0,100,100))
    label2.text = "abc"
    label2.theme = theme.label.TAG_ARRIVAL

}


//: [Previous](@previous) | [Next](@next)
