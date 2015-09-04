//
//  ThemeB.swift
//  ThemeManagerVer2
//
//  Created by Yume on 2015/5/25.
//  Copyright (c) 2015年 Yume. All rights reserved.
//

import Foundation

class ThemeB:ThemeA {
    override var text:TextThemeProtocol { get { return TextThemeB() }}
}

class TextThemeB: TextThemeA {
    override func title() -> resultType {
        return "aa"
    }
}