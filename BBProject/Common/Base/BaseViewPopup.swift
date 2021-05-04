//
//  BaseViewPopup.swift
//  BBProject
//
//  Created by QTCTEK COMP on 11/17/20.
//  Copyright © 2020 QTCTEK COMP. All rights reserved.
//


import UIKit

enum TYPE_POPUP{
    case SUCCESS
    case ERROR
}

class BaseViewPopUp: BaseView {
    //MARK: UI ELements
    var viewMain : UIView = {
        let v = UIView()
        v.layer.cornerRadius = Dimension.shared.BBWidth(width: 10)
        v.layer.shadowOffset = CGSize(width: 3, height: 3)
        v.layer.shadowRadius = 4.0
        v.layer.shadowOpacity = 0.8
        v.layer.shadowColor = UIColor.gray.withAlphaComponent(0.7).cgColor
        v.backgroundColor = UIColor.white
        return v
    }()
    var imgMess : UIImageView = {
        let img = UIImageView()
        img.image = Resource.Images.shared.checkerror1
        return img
    }()
    var lbl_Title : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 18))
        lbl.textColor = .black
        return lbl
    }()
    var lbl_mess : UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.font = UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: 17))
        lbl.textColor = .black
        return lbl
    }()
    lazy var btnOK : UIButton = {
        let btn = UIButton()
        btn.setTitle("OK", for: .normal)
        btn.customButton(color: Theme.shared.button_color, radius: Dimension.shared.BBHeight(height: 8), borderwidth: 0, bodercolor: .clear, titlecolor: .white)
        //btn.addTarget(self, action: #selector(dismisPopUp(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    //MARK: view LifeCycle
    
    override func initialize() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        setupViewMain()
        setupImg()
        setupLblTitle()
        setupLblMess()
        setupBtnOK()
        
    }
    func showPopUp(parentView : UIView, mess : String, title : String, type: TYPE_POPUP) {
        parentView.addSubview(self)
        self.frame = CGRect(x: 0, y: 0, width: Dimension.shared.width_screen, height: Dimension.shared.height_screen)
        lbl_mess.text = mess
        lbl_Title.text = title
        //imgMess.image = img
        switch type {
        case TYPE_POPUP.SUCCESS:
            imgMess.image =  Resource.Images.shared.checksuccess
            break
        case TYPE_POPUP.ERROR:
            imgMess.image =  Resource.Images.shared.checkerror1
            break
        }
    }
    
    //MARK: setup view
    func setupViewMain() {
        addSubview(viewMain)
        viewMain.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 20))
        }
    }
    func setupImg() {
        viewMain.addSubview(imgMess)
        imgMess.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 10))
            make.height.equalTo(Dimension.shared.BBHeight(height: 60))
            make.width.equalTo(imgMess.snp.height)
            make.centerX.equalToSuperview()
        }
    }
    func setupLblTitle() {
        viewMain.addSubview(lbl_Title)
        lbl_Title.snp.makeConstraints { (make) in
            make.top.equalTo(imgMess.snp.bottom).offset(Dimension.shared.BBHeight(height: 25))
            make.centerX.equalToSuperview()
            make.left.equalTo(Dimension.shared.BBWidth(width: 20))
        }
    }
    func setupLblMess() {
        viewMain.addSubview(lbl_mess)
        lbl_mess.snp.makeConstraints { (make) in
            make.top.equalTo(lbl_Title.snp.bottom).offset(Dimension.shared.BBHeight(height: 25))
            make.centerX.equalToSuperview()
            make.left.equalTo(Dimension.shared.BBWidth(width: 20))
        }
    }
    func setupBtnOK() {
        viewMain.addSubview(btnOK)
        btnOK.snp.makeConstraints { (make) in
            make.top.equalTo(lbl_mess.snp.bottom).offset(Dimension.shared.BBHeight(height: 25))
            make.width.equalTo(Dimension.shared.width_screen / 3)
            make.height.equalTo(Dimension.shared.BBHeight(height: 40))
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-Dimension.shared.BBHeight(height: 30))
        }
    }
}


