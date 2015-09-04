//
//  ThemeManager.swift
//  ThemeManagerVer2
//
//  Created by Yume on 2015/5/25.
//  Copyright (c) 2015年 Yume. All rights reserved.
//

import Foundation

public class ThemeManager {
    
    public class var sharedInstance: ThemeManager {
        dispatch_once(&Inner.token) {
            Inner.instance = ThemeManager()
        }
        return Inner.instance!
    }
    
    struct Inner {
        static var instance: ThemeManager?
        static var token: dispatch_once_t = 0
    }
    
    var theme:ThemeProtocol = ThemeA()
    
}

public var theme:ThemeProtocol { get { return ThemeManager.sharedInstance.theme }}