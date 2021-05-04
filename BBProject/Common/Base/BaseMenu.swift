//
//  BaseMenu.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

class BaseSlideMenu: BaseView, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UI ELements
    var arrTitle : [ItemMenu] = []
    lazy var tbvSlideMenu : BaseTableView = {
        let tbv = BaseTableView(frame: CGRect.zero, style: .plain)
        tbv.backgroundColor = .white
        tbv.register(CellInfoMenu.self, forCellReuseIdentifier: "CellInfoMenu")
        tbv.register(CellSlideMenu.self, forCellReuseIdentifier: "CellSlideMenu")
        tbv.separatorStyle = .singleLine
        tbv.delegate = self
        tbv.dataSource = self
        tbv.estimatedRowHeight = 70
        tbv.rowHeight = UITableViewAutomaticDimension
        tbv.backgroundColor = Theme.shared.bg_header
        return tbv
    }()
    var btnHideSlideMenu : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return btn
    }()
    var btnClose : UIButton = {
        let btn = UIButton()
        //btn.setImage(Resource.Images.delete_admin, for: .normal)
        btn.clipsToBounds = true
        return btn
    }()
    
    //MARK: View LifeCycle
    override func initialize() {
        backgroundColor = UIColor.clear
        setuptbvSlideMenu()
        setupBtnHideSlideMenu()
        setupBtnClose()
        tbvSlideMenu.reloadData()
        btnHideSlideMenu.isHidden = true
        btnClose.isHidden = true
    }
    
    //MARK: Setup view
    
    func setuptbvSlideMenu() {
        self.addSubview(tbvSlideMenu)
        tbvSlideMenu.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-Dimension.shared.BBWidth(width: 80))
            
        }
    }
    func setupBtnHideSlideMenu() {
        self.addSubview(btnHideSlideMenu)
        btnHideSlideMenu.snp.makeConstraints { (make) in
            make.left.equalTo(tbvSlideMenu.snp.right)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    private func setupBtnClose() {
        addSubview(btnClose)
        btnClose.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 40))
            make.right.equalToSuperview().offset(-Dimension.shared.BBWidth(width: 20))
            make.width.equalTo(Dimension.shared.BBWidth(width: 20))
            make.height.equalTo(Dimension.shared.BBWidth(width: 20))
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return arrTitle.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell : CellInfoMenu = tableView.dequeueReusableCell(withIdentifier: "CellInfoMenu", for: indexPath) as! CellInfoMenu
            cell.celldefault()
            return cell
        default:
            let cell : CellSlideMenu = tableView.dequeueReusableCell(withIdentifier: "CellSlideMenu", for: indexPath) as! CellSlideMenu
            cell.setupCell(item: arrTitle[indexPath.row])
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            NotificationCenter.default.post(name: NSNotification.Name(Resource.NotificationName.shared.select_item_slidemenu), object: arrTitle[indexPath.row].title)
        }
    }
}
class CellInfoMenu: BaseTableViewCell {
    
    //MARK: UI ELements
    private var imgAvatar : UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = UIViewContentMode.scaleAspectFit
        img.image = Resource.Images.shared.user_avatar
        return img
    }()
    private var viewContent : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    private var lblName : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 16))
        lbl.textColor = Theme.shared.text_color
        lbl.numberOfLines = 0
        return lbl
    }()
    private var imgLevel: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.image = Resource.Images.shared.Icon_Job
        return img
    }()
    private var lblLevel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 14))
        lbl.textColor = Theme.shared.button_color
        lbl.numberOfLines = 0
        return lbl
    }()
    
    //MARK: View LifeCycle
    override func initialize() {
        self.backgroundColor = Theme.shared.bg_header
        self.selectionStyle = .none
        setupImgAvatar()
        setupViewContetn()
        setupLblName()
        setupIconLevel()
        setupLblMail()
    }
    func celldefault() {
        
        imgAvatar.layer.cornerRadius = Dimension.shared.BBWidth(width: 25)
        lblName.text = ""//DefaultCustomer.shared.customer.customer_name.uppercased()
        lblLevel.text = "Admin"
        imgAvatar.layer.cornerRadius = Dimension.shared.BBWidth(width: 35)
    }
    
    //MARK: Setup view
    private func setupImgAvatar() {
        addSubview(imgAvatar)
        imgAvatar.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 20))
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 20))
            make.width.equalTo(Dimension.shared.BBWidth(width: 70))
            make.height.equalTo(imgAvatar.snp.width)
            make.bottom.lessThanOrEqualToSuperview().offset(-Dimension.shared.BBHeight(height: 40))
        }
    }
    private func setupViewContetn() {
        addSubview(viewContent)
        viewContent.snp.makeConstraints { (make) in
            make.left.equalTo(imgAvatar.snp.right)
            make.right.equalToSuperview()
            make.centerY.equalTo(imgAvatar.snp.centerY)
        }
    }
    private func setupLblName() {
        viewContent.addSubview(lblName)
        lblName.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 10))
            make.right.equalToSuperview().offset(-Dimension.shared.BBWidth(width: 10))
            make.top.equalToSuperview()
        }
    }
    private func setupIconLevel() {
        viewContent.addSubview(imgLevel)
        imgLevel.snp.makeConstraints { (make) in
            make.left.equalTo(lblName.snp.left)
            make.top.equalTo(lblName.snp.bottom).offset(Dimension.shared.BBHeight(height: 10))
            make.width.equalTo(Dimension.shared.BBWidth(width: 20))
            make.height.equalTo(imgLevel.snp.width)
        }
    }
    private func setupLblMail() {
        viewContent.addSubview(lblLevel)
        lblLevel.snp.makeConstraints { (make) in
            make.left.equalTo(imgLevel.snp.right).offset(Dimension.shared.BBWidth(width: 15))
            make.right.equalTo(lblName.snp.right)
            make.centerY.equalTo(imgLevel.snp.centerY)
            make.bottom.equalToSuperview()
        }
    }
}

class CellSlideMenu: BaseTableViewCell {
    //MARK: UI ELements
    private var lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 18))
        lbl.textColor = Theme.shared.text_color
        lbl.backgroundColor = .clear
        return lbl
    }()
    private var imgIcon : UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = UIViewContentMode.scaleToFill
        return img
    }()
    
    //MARK: View LifeCycle
    override func initialize() {
        super.initialize()
        self.backgroundColor = Theme.shared.bg_header
        setupImg()
        setupLblTitle()
        self.selectionStyle = .none
    }
    func setupCell(item : ItemMenu) {
        lblTitle.text = item.title
        imgIcon.image = item.img
        imgIcon.setImageColor(color: Theme.shared.text_color)
    }
    func setupCellSettings(item : ItemMenu){
        lblTitle.text = item.title.uppercased()
        imgIcon.image = item.img
        self.backgroundColor = .white
        lblTitle.textColor = Theme.shared.text_color
    }
    
    //MARK: Setup View
    private func setupImg() {
        addSubview(imgIcon)
        imgIcon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Dimension.shared.BBHeight(height: 20))
            make.centerY.equalToSuperview()
            make.width.equalTo(Dimension.shared.BBWidth(width: 20))
            make.height.equalTo(Dimension.shared.BBWidth(width: 20))
            make.left.equalToSuperview().offset(Dimension.shared.BBWidth(width: 20))
        }
    }
    private func setupLblTitle() {
        addSubview(lblTitle)
        lblTitle.snp.makeConstraints { (make) in
            make.left.equalTo(imgIcon.snp.right).offset(Dimension.shared.BBWidth(width: 15))
            make.right.equalToSuperview().offset(-Dimension.shared.BBWidth(width: 10))
            make.centerY.equalToSuperview()
        }
    }
}

