//
//  ToolbarHeader.swift
//  DatMon
//
//  Created by Trần Cảnh Dinh on 04/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class ToolbarHeader: BaseView {

    //MARK: VONG DOI
    override func initialize() {
        setUpBg()
        setUpIconLeft()
        setUpSearch()
    }
    //MARK: View Cha
    var viewBg : UIView = {
        let bg = UIView()
        return bg
    }()
    func setUpBg() {
        addSubview(viewBg)
        viewBg.snp.makeConstraints { make  in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(45)
        }
    }
    
    //MARK: Icon left
    var iconLeft : UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "menu1x")
        return icon
    }()
    func setUpIconLeft() {
        viewBg.addSubview(iconLeft)
        iconLeft.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    //MARK : SearchView
    
    var searchView: SearchView = {
       let search = SearchView()
        return search
    }()
    
    func setUpSearch() {
        viewBg.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(iconLeft.snp.right).offset(20)
            make.right.equalToSuperview()
            make.height.equalTo(45)
        }
    }
}
