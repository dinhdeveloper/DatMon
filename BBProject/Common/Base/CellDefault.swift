//
//  CellDefault.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class CellDefault: BaseTableViewCell {
    
    //MARK: UI ELements
    var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: Resource.FontName.shared.italic, size: Dimension.shared.BBFontsize(fsize: 16))
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    //MARK: View LifeCycle
    override func initialize() {
        setupLBlTitle()
        self.selectionStyle = .none
    }
    private func setupLBlTitle() {
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 10))
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 30))
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            
        }
    }
}

