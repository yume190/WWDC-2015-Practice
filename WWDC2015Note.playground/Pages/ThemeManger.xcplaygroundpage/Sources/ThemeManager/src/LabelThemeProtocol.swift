//
//  LabelThemeProtocol.swift
//  ThemeManagerVer2
//
//  Created by Yume on 2015/7/10.
//  Copyright © 2015年 Yume. All rights reserved.
//

import UIKit

public protocol LabelThemeProtocol {

}

public extension UILabel {
    public var theme:((label:UILabel) -> ()) {
        get {
            return {label in}
        }
        
        set {
            newValue(label: self)
        }
    }
}

public extension LabelThemeProtocol {
    typealias settingClosure = ((label:UILabel) -> ())
    
    final var CIRCLE_YELLOW_100: settingClosure {
        return { label in
            label.textColor = UIColor.whiteColor()
            label.backgroundColor = UIColor.yellowColor()
//            label.frame = CGRectMake(0, 0, 100, 100)
            label.layer.cornerRadius = 50
            label.textAlignment = .Center
            label.clipsToBounds = true
        }
    }
    
    private final var TAG: settingClosure {
        return { label in
            label.textColor = UIColor.whiteColor()
//            label.frame = CGRectMake(0, 0, 100, 50)
            label.layer.cornerRadius = 4
            label.textAlignment = .Center
            label.clipsToBounds = true
        }
    }
    
    final var TAG_ARRIVAL: settingClosure {
        return { label in
            label.theme = theme.label.TAG
            label.backgroundColor = UIColor(rgb: 0xF54C08)
        }
    }

    final var TAG_NO_BUS: settingClosure {
        return { label in
            label.theme = theme.label.TAG
            label.backgroundColor = UIColor(rgb: 0x384A56)
        }
    }

    final var TAG_TIME_TABLE: settingClosure {
        return { label in
            label.theme = theme.label.TAG
            label.backgroundColor = UIColor(rgb: 0x445A68)
        }
    }

    final var TAG_WAIT_3_TO_15: settingClosure {
        return { label in
            label.theme = theme.label.TAG
            label.backgroundColor = UIColor(rgb: 0xF37B00)
        }
    }

    final var TAG_WAIT_16_TO_FINITE: settingClosure {
        return { label in
            label.backgroundColor = UIColor(rgb: 0x006400)
            label.textColor = UIColor.whiteColor()
        }
    }

    final var TAG_WAIT_SHORT: settingClosure {
        return { label in
            label.theme = theme.label.TAG
            label.backgroundColor = UIColor(rgb: 0x0063C5)
        }
    }

    final var TAG_WAIT_SOON: settingClosure {
        return { label in
            label.theme = theme.label.TAG
            label.backgroundColor = UIColor(rgb: 0xA60816)
        }
    }
}
