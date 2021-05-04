//
//  Dimension.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class Dimension {
    public static var shared = Dimension()
    private var widthScale: CGFloat = 1.0
    private var heightScale: CGFloat = 1.0
    private let widthScreen : CGFloat = UIScreen.main.bounds.width
    private let heightScreen : CGFloat = UIScreen.main.bounds.height
    private init() {
        let witdthIP6: CGFloat = 375
        let heightIP6: CGFloat = 667
        widthScale = UIScreen.main.bounds.width / witdthIP6
        heightScale = UIScreen.main.bounds.height / heightIP6
    }
    
    //fontsize
    func BBFontsize(fsize : CGFloat) -> CGFloat{
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad )
        {
            return fsize * 1.5
        }else{
            return fsize * widthScale
        }
        
    }
    
    //height
    var height_screen : CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func BBHeight(height : CGFloat) -> CGFloat{
        return height * heightScale
    }
    
    //width
    var width_screen : CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func BBWidth(width : CGFloat) -> CGFloat{
        return width * widthScale
    }
}

