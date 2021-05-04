//
//  BaseViewNavigator.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class BaseViewNavigation : BaseView {
    
    //MARK: UI ELements
    var btnBack : UIButton = {
        let btn = UIButton()
        btn.setImage(Resource.Images.shared.back1x, for: .normal)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 16))
        lbl.textColor = Theme.shared.ograneColor
        lbl.textAlignment = .center
        return lbl
    }()
    var btnCart : UIButton = {
        let btn = UIButton()
        //btn.setImage(Resource.Images.shopping_cart1x, for: .normal)
        btn.contentHorizontalAlignment = .right
        
        return btn
    }()
    var lblquality : UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = UIColor.red
        lbl.layer.cornerRadius = Dimension.shared.BBHeight(height: 10)
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 14))
        lbl.clipsToBounds = true
        return lbl
    }()
    private var vLine : UIView = {
        let v = UIView()
        v.backgroundColor = Theme.shared.lightGrayColor.withAlphaComponent(0.4)
        v.layer.shadowOffset = CGSize(width: 0, height: 2)
        v.layer.shadowOpacity = 0.8
        v.layer.shadowRadius = 4.0
        v.layer.cornerRadius = Dimension.shared.BBHeight(height: 10)
        return v
    }()
    
    //MARK: View LifeCycle
    override func initialize() {
        self.backgroundColor = UIColor.white
        setupBtnBack()
        setupLblTitle()
        setupBtnCart()
        setupLblQuality()
        setupViewLine()
        
    }
    //MARK: action
    
    
    //MARK: Setup View
    private func setupBtnBack() {
        addSubview(btnBack)
        btnBack.snp.makeConstraints { (make) in
            make.left.equalTo(Dimension.shared.BBWidth(width: 15))
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(Dimension.shared.BBHeight(height: 25))
            make.width.equalTo(Dimension.shared.BBWidth(width: 56))
        }
    }
    private func setupLblTitle() {
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.centerY.equalTo(btnBack.snp.centerY)
            make.left.equalTo(btnBack.snp.right).offset(Dimension.shared.BBWidth(width: 5))
            make.centerX.equalToSuperview()
        }
    }
    private func setupBtnCart() {
        addSubview(btnCart)
        btnCart.snp.makeConstraints { (make) in
            make.right.equalTo(-Dimension.shared.BBWidth(width: 20))
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(Dimension.shared.BBHeight(height: 20))
            make.width.equalTo(btnCart.snp.height)
        }
    }
    func setupLblQuality() {
        addSubview(lblquality)
        lblquality.snp.makeConstraints { (make) in
            make.bottom.equalTo(btnCart.snp.top).offset((Dimension.shared.BBHeight(height: 10)))
            make.height.equalTo(Dimension.shared.BBHeight(height: 20))
            make.width.equalTo(lblquality.snp.height)
            make.left.equalTo(btnCart.snp.left).offset(Dimension.shared.BBWidth(width: 10))
        }
    }
    private func setupViewLine() {
        addSubview(vLine)
        vLine.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(Dimension.shared.BBHeight(height: 1))
            make.width.equalToSuperview()
        }
    }
}



