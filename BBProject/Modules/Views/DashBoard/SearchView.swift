//
//  SearchView.swift
//  DatMon
//
//  Created by Trần Cảnh Dinh on 04/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class SearchView: BaseView {

    override func initialize() {
        setUpBgView()
        
        setUpIconSearch()
        
        setUpEditSearch()
    }
    
    var bgView : UIView = {
       let bgView = UIView()
        bgView.layer.cornerRadius = 8
        bgView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        return bgView
    }()
    
    func setUpBgView() {
        addSubview(bgView)
        bgView.snp.makeConstraints { make  in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: icon search
    let iconSearch: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "search1x")
        return icon
    }()
    func setUpIconSearch() {
        bgView.addSubview(iconSearch)
        iconSearch.snp.makeConstraints { make  in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
    }
    //MARK: textfield
    var edtSearch: UITextField = {
        let edt = UITextField()
        edt.placeholder = "Tìm theo sản phẩm"
        edt.textColor = .black
        edt.tintColor = .gray
        edt.font = UIFont(name: Resource.FontName.shared.general, size: 14)
        return edt
    }()
    
    func setUpEditSearch() {
        bgView.addSubview(edtSearch)
        edtSearch.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(iconSearch.snp.right).offset(20)
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
}
