//
//  BaseCollectionView.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class BaseCollectionView: UICollectionView, ResuableView {
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initialize() {}
}

class BaseCollectionCell: UICollectionViewCell, ResuableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
        self.backgroundColor = UIColor.white
    }
}

class BaseCollectionReusableView: UICollectionReusableView, ResuableView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Theme.shared.bg_header
        initialize()
    }
    func initialize() {}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}


