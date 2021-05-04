//
//  API.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class API {
    private init() {}
    static var shared = API()
    
    var baseUrl : String = ""
    var baseUrl_thumbnail : String = ""
    static var detect : String = "detect"
}

