//
//  ThemeProtocol.swift
//  ThemeManagerVer2
//
//  Created by Yume on 2015/5/25.
//  Copyright (c) 2015年 Yume. All rights reserved.
//

import Foundation

public protocol ThemeProtocol {
    var text:TextThemeProtocol {get}
    var color:ColorThemeProtocol {get}
    var font:FontThemeProtocol {get}
    var image:ImageThemeProtocol {get}
    var label:LabelThemeProtocol {get}
    var button:ButtonThemeProtocol {get}
}