//
//  ButtonThemeProtocol.swift
//  BusApp
//
//  Created by Yume on 2015/7/10.
//  Copyright © 2015年 Yume. All rights reserved.
//

import UIKit

public protocol ButtonThemeProtocol {

}


extension UIButton {
    var theme:((button:UIButton) -> ()) {
        get {
            return {button in}
        }
        
        set {
            newValue(button: self)
        }
    }
}

extension ButtonThemeProtocol {
    typealias settingClosure = ((button:UIButton) -> ())
    
    private final var KEYBOARD: settingClosure {
        return { button in
            button.titleLabel?.font = UIFont.systemFontOfSize(24)
            button.titleLabel?.textColor = UIColor.whiteColor()
            button.titleLabel?.textAlignment = .Center
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.whiteColor().CGColor
            button.clipsToBounds = true
        }
    }
    
    final var KEYBOARD_LIGHT: settingClosure {
        return { button in
            button.theme = theme.button.KEYBOARD
            button.backgroundColor = UIColor(rgb: 0x88878C)
        }
    }
    
    final var KEYBOARD_DARK: settingClosure {
        return { button in
            button.theme = theme.button.KEYBOARD
            button.backgroundColor = UIColor(rgb: 0x545358)
        }
    }
    
}
