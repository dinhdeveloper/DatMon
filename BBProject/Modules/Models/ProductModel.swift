//
//  ProductModel.swift
//  DatMon
//
//  Created by Trần Cảnh Dinh on 04/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
struct ProductModel {
    var productId: Int
    var categoryId: String
    var productName: String
    var productPrice: String
    var priceSale: String
    var percentSale: String
    var rate: String
    var productImage: String
    
    init(){
        productId = 0
        categoryId = ""
        productName = ""
        productPrice = ""
        productImage = ""
        priceSale = ""
        percentSale = ""
        rate = ""
    }
    init(object: AnyObject) {
        if let dic: [String: AnyObject] = object as? [String: AnyObject]{
            productId = dic["productId"] as? Int ?? 0
            categoryId = dic["categoryId"] as? String ?? ""
            productName = dic["productName"] as? String ?? ""
            productPrice = dic["productPrice"] as? String ?? ""
            productImage = dic["productImage"] as? String ?? ""
            priceSale = dic["priceSale"] as? String ?? ""
            percentSale = dic["percentSale"] as? String ?? ""
            rate = dic["rate"] as? String ?? ""
            
        }else{
            productId = 0
            categoryId = ""
            productName = ""
            productPrice = ""
            productImage = ""
            priceSale = ""
            percentSale = ""
            rate = ""
        }
    }
}
