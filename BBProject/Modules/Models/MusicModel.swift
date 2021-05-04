//
//  MusicModel.swift
//  BBProject
//
//  Created by IOS DEV02 on 19/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit


struct MusicModel {
    var id: String
    var images: String
    var singer: String
    var links: String
    var name: String
    
    init(){
        id = ""
        images = ""
        singer = ""
        links = ""
        name = ""
    }
    init(object: AnyObject) {
        if let dic: [String: AnyObject] = object as? [String: AnyObject]{
            id = dic["id"] as? String ?? ""
            images = dic["images"] as? String ?? ""
            singer = dic["singer"] as? String ?? ""
            links = dic["links"] as? String ?? ""
            name = dic["name"] as? String ?? ""
        }else{
            id = ""
            images = ""
            singer = ""
            links = ""
            name = ""
        }
    }
}
