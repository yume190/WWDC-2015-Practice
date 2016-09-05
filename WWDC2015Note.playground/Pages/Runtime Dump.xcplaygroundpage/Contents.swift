//: [Previous](@previous)

import UIKit

func accDump(x:NSObject) {
    //        self.UIAccessibilityVoiceOverStatusChanged >>- print
    //        self.UIAccessibilityMonoAudioStatusDidChangeNotification >>- print
    //        self.UIAccessibilityClosedCaptioningStatusDidChangeNotification >>- print
    //        self.UIAccessibilityInvertColorsStatusDidChangeNotification >>- print
    //        self.UIAccessibilityGuidedAccessStatusDidChangeNotification >>- print
    //        self.UIAccessibilityBoldTextStatusDidChangeNotification >>- print
    //        self.UIAccessibilityGrayscaleStatusDidChangeNotification >>- print
    //        self.UIAccessibilityReduceTransparencyStatusDidChangeNotification >>- print
    //        self.UIAccessibilityReduceMotionStatusDidChangeNotification >>- print
    //        self.UIAccessibilityDarkerSystemColorsStatusDidChangeNotification >>- print
    //        self.UIAccessibilitySwitchControlStatusDidChangeNotification >>- print
    //        self.UIAccessibilitySpeakSelectionStatusDidChangeNotification >>- print
    //        self.UIAccessibilitySpeakScreenStatusDidChangeNotification >>- print
    //        self.UIAccessibilityShakeToUndoDidChangeNotification >>- print
    print(x.isAccessibilityElement)
    print(x.accessibilityLabel)
    print(x.accessibilityHint)
    print(x.accessibilityValue)
    print(x.accessibilityTraits)
    print(x.accessibilityFrame)
    print(x.accessibilityPath)
    print(x.accessibilityActivationPoint)
    print(x.accessibilityLanguage)
    print(x.accessibilityElementsHidden)
    print(x.accessibilityViewIsModal)
    print(x.shouldGroupAccessibilityChildren)
    print(x.accessibilityNavigationStyle)
    print(x.accessibilityElements)
    print(x.accessibilityCustomActions)
}

func yumeDump(pointer:UnsafeMutablePointer<objc_property_t>) {
    var next = pointer
    while next.memory.hashValue != 0 {
        let name = NSString(UTF8String:property_getName(next.memory))
        let type = NSString(UTF8String:property_getAttributes(next.memory))
        print("\(type):\(name)")
        next = next.successor()
    }
}

var outCount:UInt32 = 0
let pl3 = class_copyPropertyList(UIAlertController.classForCoder(), &outCount)
yumeDump(pl3)
let pl4 = class_copyIvarList(UIAlertController.classForCoder(), &outCount)
yumeDump(pl4)
