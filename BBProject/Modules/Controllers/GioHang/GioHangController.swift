//
//  GioHangController.swift
//  DatMon
//
//  Created by Trần Cảnh Dinh on 04/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit

class GioHangController: BaseView {
    
    override func initialize() {
        setupViewMoney()
        setupLblMoney()
        setUpBgView()
        setUpIconGH()
        viewMoney.isHidden = true
    }
    
    
    var viewMoney: UIView = {
        let v = UIView()
        v.backgroundColor = Theme.shared.item_click_category
        v.layer.cornerRadius = 30
        v.clipsToBounds = true
        return v
    }()
    private var lblMoney: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont(name: Resource.FontName.shared.bold, size: 16)
        lbl.text = "150.000"
        return lbl
    }()
    private func setupViewMoney(){
        addSubview(viewMoney)
        viewMoney.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.centerY.equalToSuperview()
        }
    }
    private func setupLblMoney(){
        viewMoney.addSubview(lblMoney)
        lblMoney.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-60)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
    
    
    
  lazy  var backgroundView : UIButton = {
        let bg = UIButton()
        bg.layer.cornerRadius = 30
        bg.backgroundColor = .white
        bg.layer.borderColor = Theme.shared.item_click_category.cgColor
        //bg.addTarget(self, action: #selector(onClickItem), for: .touchUpInside)
        bg.layer.borderWidth = 5
        
        return bg
    }()
    
    func setUpBgView() {
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
    }
    
    var imageIcon : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "shoping1x")
        img.contentMode = .center
        return img
    }()
    
    func setUpIconGH() {
        backgroundView.addSubview(imageIcon)
        imageIcon.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
}
