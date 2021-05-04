//
//  MenuBar.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        setupCollMenuBar()
        NotificationCenter.default.addObserver(self, selector: #selector(self.animateMenu(notification:)), name: Notification.Name.init(rawValue: "scrollMenu"), object: nil)
        
    }
    var menuTitle = ["Title1", "Title2", "Title3"]
    var selectedIndex = 0
    
    lazy var collBarMenu : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.delegate = self
        cv.dataSource = self
        layout.scrollDirection = .horizontal
        cv.showsHorizontalScrollIndicator = false
        cv.register(CellBarMenu.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    //MARK: Action
    @objc func animateMenu(notification: Notification) {
        if let info = notification.userInfo {
            let userInfo = info as! [String: CGFloat]
            self.selectedIndex = Int(round(userInfo["length"]!))
            collBarMenu.reloadData()
            self.layoutIfNeeded()
            
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuTitle.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CellBarMenu = collBarMenu.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellBarMenu
        if self.selectedIndex == indexPath.row {
            cell.isSelected = true
        }
        cell.displayCell(title: menuTitle[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collBarMenu.frame.width / CGFloat(menuTitle.count), height: collBarMenu.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.selectedIndex != indexPath.row {
            self.selectedIndex = indexPath.row
            NotificationCenter.default.post(name: Notification.Name.init(rawValue: "didSelectMenu"), object: nil, userInfo: ["index": self.selectedIndex])
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    private func setupCollMenuBar() {
        addSubview(collBarMenu)
        collBarMenu.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}

class CellBarMenu: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected : Bool{
        didSet {
            vLine.backgroundColor = isSelected ? Theme.shared.greenColor : Theme.shared.lightGrayColor
            lblTitle.font = isSelected ? UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 16)) : UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: 16))
        }
    }
    func setupView() {
        setupLblTitle()
        setupVline()
    }
    func displayCell(title : String){
        lblTitle.text = title
    }
    var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor = Theme.shared.blueColor
        lbl.font = UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: 16))
        lbl.textAlignment = .center
        return lbl
    }()
    var vLine : UIView = {
        let v = UIView()
        v.backgroundColor = Theme.shared.lightGrayColor
        return v
    }()
    private func setupLblTitle() {
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    private func setupVline() {
        addSubview(vLine)
        vLine.snp.makeConstraints { (make) in
            make.height.equalTo(Dimension.shared.BBHeight(height: 1))
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
}




