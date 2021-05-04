//
//  ResultResponse.swift
//  BBProject
//
//  Created by QTCTEK COMP on 11/17/20.
//  Copyright © 2020 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit

struct ResultResponse {
    var success: String
    var data: [AnyObject]
    var message: String
    
    init() {
        success = ""
        data = []
        message = ""
    }
    init(object: AnyObject) {
        if let dic: [String: AnyObject] = object as? [String: AnyObject] {
            success = dic["success"] as? String ?? ""
            data = dic["data"] as? [AnyObject] ?? []
            message = dic["message"] as? String ?? ""
        }else{
            success = ""
            data = []
            message = ""
        }
    }
}


struct ItemMenu {
    var img : UIImage
    var title : String
    
    init() {
        img = UIImage()
        title = ""
    }
    init(_img: UIImage, _title: String) {
        img = _img
        title = _title
    }
}



