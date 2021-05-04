//
//  ItemCategoryCell.swift
//  DatMon
//
//  Created by Trần Cảnh Dinh on 04/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit

class ItemCategoryCell: BaseCollectionCell {
    
    override func initialize() {
        setUpView()
        setUpTvCategory()
    }
    
    var viewTexView: UIView = {
        let viewTv = UIView()
        viewTv.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        viewTv.layer.cornerRadius = 20
        return viewTv
    }()
    
    func setUpView() {
        addSubview(viewTexView)
        viewTexView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    var tvCategory: UILabel = {
        let tvCategory = UILabel()
        tvCategory.textColor = .black
        tvCategory.textAlignment = .center
        tvCategory.font = .systemFont(ofSize: 14)
        return tvCategory
    }()
    
    func setUpTvCategory() {
        viewTexView.addSubview(tvCategory)
        tvCategory.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func displayCell(customer: CategoryModel){
        tvCategory.text = customer.categoryName
        if customer.checkChoose {
            viewTexView.backgroundColor = Theme.shared.item_click_category
            tvCategory.textColor = .black
        }else{
            viewTexView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
            tvCategory.textColor = .black
        }
    }
}

