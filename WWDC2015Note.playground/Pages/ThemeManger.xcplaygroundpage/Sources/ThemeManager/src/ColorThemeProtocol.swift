//
//  ColorThemeProtocol.swift
//  ThemeManagerVer2
//
//  Created by Yume on 2015/5/25.
//  Copyright (c) 2015年 Yume. All rights reserved.
//

import UIKit

public protocol ColorThemeProtocol {
    func title() -> UIColor
    func content() -> UIColor
}

public extension UIColor {

    public convenience init(rgb:Int){
        self.init(
            red: ((CGFloat) ((rgb & 0xFF0000) >> 16)) / 255.0,
            green: ((CGFloat) ((rgb & 0x00FF00) >> 8)) / 255.0,
            blue: ((CGFloat) ((rgb & 0x0000FF) >> 0)) / 255.0,
            alpha: 1)
    }
}