//
//  TestTableView.swift
//  BBProject
//
//  Created by IOS DEV02 on 19/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class TestTableView : vcBaseController {
    Alamofire.request("https://appmusic-test.herokuapp.com/song/list").responseJSON{
        (res) in print(res)
    }
}
