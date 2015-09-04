//
//  ImageThemeProtocol.swift
//  ThemeManagerVer2
//
//  Created by Yume on 2015/5/25.
//  Copyright (c) 2015年 Yume. All rights reserved.
//

import UIKit

public protocol ImageThemeProtocol {
    func waiting() -> UIImage
}

extension UIImage {
    enum AssetIdentifier: String {
    case Back = "back"
    case HeartHollow  = "heart_hollow"
    case HeartSolid   = "heart_solid"
    case Menu = "menuButton"
    }
    
    convenience init!(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
}