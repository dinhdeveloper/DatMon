//
//  PopUpTwoAction.swift
//  BBProject
//
//  Created by QTCTEK COMP on 11/17/20.
//  Copyright © 2020 QTCTEK COMP. All rights reserved.
//


import UIKit

class PopUpTwoAction: BaseView {
    //MARK: UI ELements
    
    private var viewMain : UIView = {
        let v = UIView()
        v.layer.cornerRadius = Dimension.shared.BBWidth(width: 10)
        v.backgroundColor = .white
        return v
    }()
    var img_success : UIImageView = {
        let img = UIImageView()
        img.image = Resource.Images.shared.warning_yellow
        img.clipsToBounds = true
        return img
    }()
    private var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = Theme.shared.main_color
        lbl.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 24))
        lbl.textAlignment = .center
        return lbl
    }()
    private var lbl_mess : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: 17))
        lbl.textColor = .black
        return lbl
    }()
    var btnRight : UIButton = {
        let btn = UIButton()
        btn.customButton(color: Theme.shared.button_color, radius: Dimension.shared.BBHeight(height: 8), borderwidth: Dimension.shared.BBHeight(height: 1), bodercolor: Theme.shared.button_color, titlecolor: .white)
        btn.titleLabel?.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 14))
        btn.addshadow(width: 1, height: 3, opacity: 0.5, radius: 3.0, color: UIColor.gray)
        btn.setTitle("Từ chối", for: .normal)
        return btn
    }()
    var btnleft : UIButton = {
        let btn = UIButton()
        btn.customButton(color: Theme.shared.lightGrayColor, radius: Dimension.shared.BBHeight(height: 8), borderwidth: Dimension.shared.BBHeight(height: 1), bodercolor: Theme.shared.lightGrayColor, titlecolor: .white)
        btn.titleLabel?.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 14))
        btn.addshadow(width: 1, height: 3, opacity: 0.5, radius: 3.0, color: UIColor.gray)
        btn.setTitle("Đồng ý", for: .normal)
        return btn
    }()
    
    //MARK: view LifeCycle
    
    override func initialize() {
        setupViewMain()
        setupImg()
        setupLblTitle()
        setupLblMess()
        setupBtnAction2()
        setupBtnAction1()
    }
    func showPopUp(parentView : UIView, title: String, mess : String) {
        parentView.addSubview(self)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.frame = CGRect(x: 0, y: 0, width: Dimension.shared.width_screen, height: Dimension.shared.height_screen)
        lbl_mess.text = mess
        lblTitle.text = title
    }
    
    //MARK: setup view
    func setupViewMain() {
        addSubview(viewMain)
        viewMain.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 30))
        }
    }
    func setupImg() {
        viewMain.addSubview(img_success)
        img_success.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 10))
            make.height.equalTo(Dimension.shared.BBHeight(height: 70))
            make.width.equalTo(img_success.snp.height)
            make.centerX.equalToSuperview()
        }
    }
    private func setupLblTitle(){
        viewMain.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.top.equalTo(img_success.snp.bottom).offset(Dimension.shared.BBHeight(height: 25))
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 20))
        }
    }
    func setupLblMess() {
        viewMain.addSubview(lbl_mess)
        lbl_mess.snp.makeConstraints { (make) in
            make.top.equalTo(lblTitle.snp.bottom).offset(Dimension.shared.BBHeight(height: 20))
            make.centerX.equalToSuperview()
            make.left.equalTo(Dimension.shared.BBWidth(width: 20))
        }
    }
    func setupBtnAction2() {
        viewMain.addSubview(btnleft)
        btnleft.snp.makeConstraints { (make) in
            make.top.equalTo(lbl_mess.snp.bottom).offset(Dimension.shared.BBHeight(height: 30))
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 30))
            make.height.equalTo(Dimension.shared.BBHeight(height: 40))
            make.width.equalTo(Dimension.shared.BBWidth(width: 110))
            make.bottom.equalToSuperview().offset(-Dimension.shared.BBHeight(height: 30))
        }
    }
    func setupBtnAction1() {
        viewMain.addSubview(btnRight)
        btnRight.snp.makeConstraints { (make) in
            make.top.equalTo(btnleft.snp.top)
            make.right.equalToSuperview().offset(-Dimension.shared.BBWidth(width: 30))
            make.height.equalTo(Dimension.shared.BBHeight(height: 40))
            make.width.equalTo(btnleft.snp.width)
        }
    }
}




