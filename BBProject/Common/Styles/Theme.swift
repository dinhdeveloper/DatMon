//
//  Theme.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class Theme {
    public static var shared = Theme()
    private init(){}
    
    
    //FE6439
    var ograneColor : UIColor {
        return #colorLiteral(red: 0.9960784314, green: 0.3921568627, blue: 0.2235294118, alpha: 1)
    }
    var greenColor : UIColor {
        return #colorLiteral(red: 0.003921568627, green: 0.5333333333, blue: 0.09019607843, alpha: 1)
    }
    var blueColor : UIColor {
        return #colorLiteral(red: 0.2156862745, green: 0.3647058824, blue: 0.5882352941, alpha: 1)
    }
    var lightGrayColor : UIColor {
        return UIColor.lightGray.withAlphaComponent(0.8)
    }
    
    var bg_search : UIColor {
        return #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 0.4911971831)
    }
    var bg_header : UIColor {
        return #colorLiteral(red: 0.9685223699, green: 0.9686879516, blue: 0.9685119987, alpha: 1)
    }
    var main_color : UIColor {
        return #colorLiteral(red: 0.003921568627, green: 0.5333333333, blue: 0.09019607843, alpha: 1)
    }
    var button_color: UIColor {
        return #colorLiteral(red: 0.003921568627, green: 0.5333333333, blue: 0.09019607843, alpha: 1)
    }
    var text_color: UIColor {
        return #colorLiteral(red: 0.003921568627, green: 0.5333333333, blue: 0.09019607843, alpha: 1)
    }
    var white_color : UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    var black_color: UIColor {
        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    var lightgray_color: UIColor {
        return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    var item_click_category: UIColor {
        return UIColor.init(hexString: "#F6C434")
    }
}


