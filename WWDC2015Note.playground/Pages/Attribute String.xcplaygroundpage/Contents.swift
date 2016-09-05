//: [Previous](@previous)

import UIKit

extension String {
    func aaa(font:UIFont,fontColor:UIColor) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self, attributes: [
            NSForegroundColorAttributeName:fontColor,
            NSFontAttributeName:font
            ])
    }
}

func + (l:String,r:NSAttributedString) -> NSAttributedString {
    let str = NSMutableAttributedString(string: l)
    str.appendAttributedString(r)
    return str
}
//
//func + (l:String,r:NSMutableAttributedString) -> NSAttributedString {
//
//}

func + (l:NSAttributedString,r:String) -> NSAttributedString {
    let str = NSMutableAttributedString(attributedString: l)
    str.appendAttributedString(NSAttributedString(string: r))
    return str
}

//func + (l:NSMutableAttributedString,r:String) -> NSAttributedString {
//    let str = l
//    str.appendAttributedString(NSAttributedString(string: r))
//    return str
//}

func + (l:NSAttributedString,r:NSAttributedString) -> NSAttributedString {
    let str = NSMutableAttributedString(attributedString: l)
    str.appendAttributedString(r)
    return str
}

let label = UILabel(frame: CGRect(x: 0,y: 0,width: 100,height: 50))
label.textAlignment = .Center
label.backgroundColor = UIColor.purpleColor()
label.clipsToBounds = true
label.textColor = UIColor.whiteColor()
label.layer.cornerRadius = 25
label.layer.borderWidth = 2
label.layer.borderColor = UIColor.whiteColor().CGColor
label.text = "abc"


//let str = NSMutableAttributedString(string: "abc", attributes: [
//    NSForegroundColorAttributeName:UIColor.greenColor(),
//    NSBackgroundColorAttributeName:UIColor.purpleColor(),
//    NSFontAttributeName:UIFont.systemFontOfSize(10)
//    ])
//str.appendAttributedString(NSAttributedString(string: "bbbbbb"))
let str = "abc".aaa(UIFont.systemFontOfSize(10), fontColor: UIColor.redColor())
//str.appendAttributedString(NSAttributedString(string: "bbbbbb"))
label.attributedText = "aaa" + str + "bbb"
label


public extension UIColor {
    convenience public init(rgb:Int){
        self.init(
            red: ((CGFloat) ((rgb & 0xFF0000) >> 16)) / 255.0,
            green: ((CGFloat) ((rgb & 0x00FF00) >> 8)) / 255.0,
            blue: ((CGFloat) ((rgb & 0x0000FF) >> 0)) / 255.0,
            alpha: 1)
    }
}

let hMaskLayer = CAGradientLayer()
let v = UIView(frame: CGRectMake(0, 0, 100, 200))
v.layer.addSublayer(hMaskLayer)

//hMaskLayer.opacity = 1
hMaskLayer.colors =
    [
    UIColor(rgb: 0xE1EA8A).CGColor,
    UIColor(rgb: 0x67AA37).CGColor,
    UIColor(rgb: 0xF1CD5F).CGColor,
    UIColor(rgb: 0xB0CB29).CGColor
]
//hMaskLayer.locations = [
//    0,
//    0.2,
//    0.8,
//    1
//]
hMaskLayer.startPoint = CGPointMake(0, 0)
hMaskLayer.endPoint = CGPointMake(1.0, 1.0)
hMaskLayer.frame = v.bounds

v



var gradientView = UIView(frame: CGRectMake(0, 0, 300, 300))
var gradientLayer = CAGradientLayer()
gradientLayer.frame = gradientView.bounds
gradientView.layer.addSublayer(gradientLayer)
gradientLayer.colors = [UIColor.redColor().CGColor,UIColor.blueColor().CGColor]
gradientLayer.startPoint = CGPointMake(0, 0)
gradientLayer.endPoint = CGPointMake(1, 1)
gradientView






