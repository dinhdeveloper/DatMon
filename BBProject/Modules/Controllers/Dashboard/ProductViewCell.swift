//
//  ProductViewCell.swift
//  DatMon
//
//  Created by Trần Cảnh Dinh on 04/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class ProductViewCell: BaseCollectionCell {
    override func initialize() {
        setUpViewItem()
        setUpImvProduct()
        setUpNameProduct()
    }
    
    var viewItem: UIView =  {
       let viewItem = UIView()
        viewItem.layer.borderWidth = 1
        viewItem.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        viewItem.layer.cornerRadius = 5
        return viewItem
    }()
    
    func setUpViewItem() {
        addSubview(viewItem)
        viewItem.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    var imvProduct: UIImageView = {
        let imvProduct = UIImageView()
        imvProduct.layer.cornerRadius = 50
        return imvProduct
    }()
    
    func setUpImvProduct() {
        viewItem.addSubview(imvProduct)
        imvProduct.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    var tvNameProduct: UILabel = {
        let tvNameProduct = UILabel()
        tvNameProduct.textColor = .black
        tvNameProduct.textAlignment = .center
        tvNameProduct.font = .systemFont(ofSize: 16)
        tvNameProduct.numberOfLines = 1
        return tvNameProduct
    }()
    
    func setUpNameProduct() {
        viewItem.addSubview(tvNameProduct)
        tvNameProduct.snp.makeConstraints { (make) in
            make.top.equalTo(imvProduct.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func displayCell(customer: ProductModel){
        tvNameProduct.text = customer.productName
        imvProduct.displayImgPhoto(urlPhoto: customer.productImage, photo_default: Resource.Images.shared.photoDefault)
    }
}
