//
//  ThemeA.swift
//  ThemeManagerVer2
//
//  Created by Yume on 2015/5/25.
//  Copyright (c) 2015年 Yume. All rights reserved.
//

import UIKit

class ThemeA:ThemeProtocol {
    var text:TextThemeProtocol { get { return TextThemeA() }}
    var color:ColorThemeProtocol { get { return  ColorThemeA() }}
    var font:FontThemeProtocol { get { return FontThemeA() }}
    var image:ImageThemeProtocol { get { return ImageThemeA() }}
    var label:LabelThemeProtocol { get { return LabelThemeA() }}
    var button:ButtonThemeProtocol { get { return ButtonThemeA() }}
}

class TextThemeA: TextThemeProtocol {
    typealias resultType = String
    func title() -> resultType {
        return "a"
    }
    func content() -> String {
        return "b"
    }
}

class ColorThemeA: ColorThemeProtocol {
    func title() -> UIColor {
        return UIColor.blueColor()
    }
    
    func content() -> UIColor {
        return UIColor.redColor()
    }
}

class FontThemeA: FontThemeProtocol {
    func title() -> UIFont {
        return UIFont()
    }
}

class ImageThemeA: ImageThemeProtocol {
    func waiting() -> UIImage {
        return UIImage()
    }
}

class LabelThemeA: LabelThemeProtocol {}
class ButtonThemeA: ButtonThemeProtocol {}