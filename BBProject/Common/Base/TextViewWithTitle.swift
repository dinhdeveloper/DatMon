//
//  TextViewWithTitle.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class TextViewBoderdWithTitle: BaseView {
    
    //MARK: Properties
    public var heightTxtInput : CGFloat? {
        didSet{
            textViewInput.snp.updateConstraints { (make) in
                make.height.equalTo(heightTxtInput ?? 0)
            }
        }
    }
    
    //MARK: UI ELements
    var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.font = UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: 16))
        return lbl
    }()
    
    var textViewInput : UITextView = {
        let txt = UITextView()
        txt.textColor = UIColor.black
        txt.font = UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: 16))
        txt.textColor = UIColor.black
        txt.isScrollEnabled = false
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
        addDoneToolBar(textViewInput)
    }
    
    //MARK: Action
    func addDoneToolBar(_ textview : UITextView){
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
        textview.inputAccessoryView = toolBar
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
            make.top.equalToSuperview()
            make.height.equalTo(Dimension.shared.BBHeight(height: 21))
        }
    }
    private func setupTxtInput(){
        addSubview(textViewInput)
        textViewInput.snp.makeConstraints { (make) in
            make.top.equalTo(lblTitle.snp.bottom).offset(Dimension.shared.BBHeight(height: 5))
            make.left.equalTo(lblTitle.snp.left)
            //make.height.equalTo(Dimension.shared.height_42)
            make.height.greaterThanOrEqualTo(Dimension.shared.BBHeight(height: 42))
            make.centerX.equalToSuperview()
        }
    }
    private func setupViewLine(){
        addSubview(viewLine)
        viewLine.snp.makeConstraints { (make) in
            make.height.equalTo(Dimension.shared.BBHeight(height: 1))
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(textViewInput.snp.bottom)
        }
    }
}



