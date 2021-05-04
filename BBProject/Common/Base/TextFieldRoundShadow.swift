//
//  TextFieldRoundShadow.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit


class TextFieldRoundShadow: BaseView {
    
    public var placeholder : String? {
        didSet {
            txtInput.attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                                attributes: [NSAttributedStringKey.foregroundColor: Theme.shared.ograneColor, NSAttributedStringKey.font : UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: 16)) as Any])
        }
    }
    
    //MARK: UI Elements
    
    var txtInput : UITextField = {
        let txt = UITextField()
        txt.borderStyle = .none
        txt.clearButtonMode = .whileEditing
        txt.tintColor = Theme.shared.ograneColor
        txt.font = UIFont.systemFont(ofSize: Dimension.shared.BBFontsize(fsize: 16))
        txt.layer.shadowColor = UIColor.black.cgColor
        txt.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        txt.layer.shadowOpacity = 0.8
        txt.layer.shadowRadius = 4.0
        txt.layer.cornerRadius = Dimension.shared.BBHeight(height: 21)
        txt.textColor = Theme.shared.ograneColor
        txt.textAlignment = .center
        txt.backgroundColor = UIColor.white
        return txt
    }()
    
    //MARK: View LifeCycle
    override func initialize() {
        setupTxtInput()
        addDoneToolBar(txtInput)
    }
    
    //MARK: Action
    func addDoneToolBar(_ textField : UITextField){
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Xong", style: .plain, target: self, action: #selector(self.clickhideKeyboard))
        doneButton.tintColor = Theme.shared.ograneColor
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }
    //an keyboard
    @objc func clickhideKeyboard(){
        self.endEditing(true)
    }
    private func setupTxtInput(){
        addSubview(txtInput)
        txtInput.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 5))
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 5))
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

