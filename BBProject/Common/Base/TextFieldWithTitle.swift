//
//  TextFieldWithTitle.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class TextFieldWithTitle: BaseView {
    
    //MARK: Properties
    public var titleView : String? {
        didSet {
            lblTitle.text = titleView
        }
    }
    public var placeholder : String? {
        didSet {
            txtInput.placeholder = placeholder
        }
    }
    
    public var input : String? {
        didSet {
            txtInput.text = input
        }
    }
    public var keyboard : UIKeyboardType? {
        didSet {
            txtInput.keyboardType = keyboard ?? UIKeyboardType.default
        }
    }
    public var widthTxtInput : CGFloat? {
        didSet{
            txtInput.snp.updateConstraints { (make) in
                make.width.equalTo(widthTxtInput ?? 0)
            }
        }
    }
    
    //MARK: UI ELements
    private var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.font = UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: 16))
        return lbl
    }()
    
    var txtInput : UITextField = {
        let txt = UITextField()
        txt.borderStyle = .none
        txt.clearButtonMode = .whileEditing
        txt.tintColor = UIColor.black
        txt.font = UIFont.systemFont(ofSize: Dimension.shared.BBFontsize(fsize: 16))
        return txt
    }()
    
    private var viewLine : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.black
        return v
    }()
    
    
    
    //MARK: View LifeCycle
    override func initialize() {
        setupTitle()
        setupTxtInput()
        setupViewLine()
        addDoneToolBar(txtInput)
    }
    
    //MARK: Action
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
    
    //MARK: SetupView
    private func setupTitle(){
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 1))
        }
    }
    private func setupTxtInput(){
        addSubview(txtInput)
        txtInput.snp.makeConstraints { (make) in
            make.top.equalTo(lblTitle.snp.bottom).offset(Dimension.shared.BBHeight(height: 5))
            make.left.equalToSuperview()
            make.height.equalTo(Dimension.shared.BBHeight(height: 40))
            make.centerX.equalToSuperview()
            
        }
    }
    private func setupViewLine(){
        addSubview(viewLine)
        viewLine.snp.makeConstraints { (make) in
            make.top.equalTo(txtInput.snp.bottom)
            make.height.equalTo(Dimension.shared.BBHeight(height: 1))
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}





