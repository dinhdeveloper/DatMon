//
//  DashBoardControllerViewController.swift
//  DatMon
//
//  Created by Trần Cảnh Dinh on 04/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import UIKit
import Alamofire

class DashBoardController: vcBaseController {
   
    var arrCategory: [CategoryModel] = []
    var arrProduct: [ProductModel] = []
    var arrTemp: [ProductModel] = []
    private var time: Timer!
    
    
    //MARK: vong doi
    override func initialize() {
        view.backgroundColor = .white
        setUpToolBar()
        setUpTitle()
        setUpColectView()
        
        getListCategory()
        
        NotificationCenter.default.addObserver(self, selector: #selector(getCategoryId(_:)), name: NSNotification.Name("CATE"), object: nil)
        
        showFloatAction()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: api
    @objc func getCategoryId(_ idCategory: Notification){
        guard let result: [String: AnyObject] = idCategory.object as? [String: AnyObject] else {
            return
        }
        let id = result["id"] as? Int ?? 0
        arrCategory = result["arr"] as? [CategoryModel] ?? []
        arrProduct = []
        getListProduct(idCategory: id)
    }
    
    func getListCategory() {
        Alamofire.request("https://mobishops.herokuapp.com/category/list").responseJSON{ [self](res) in
            let object: AnyObject = res.value as AnyObject
            let dic: [AnyObject] = object as? [AnyObject] ?? []
            dic.forEach { (i) in
                let item = CategoryModel(object: i)
                self.arrCategory.append(item)
            }
            if arrCategory.count > 0{
                arrCategory[0].checkChoose = true
                getListProduct(idCategory: arrCategory[0].categoryId)
            }
            colectionView.reloadData()
        }
    }
    
    func getListProduct(idCategory : Int) {
        Alamofire.request("https://mobishops.herokuapp.com/product/cate=\(idCategory)").responseJSON{ [self](res) in
            
            let object: AnyObject = res.value as AnyObject
            let dic: [AnyObject] = object as? [AnyObject] ?? []
            dic.forEach { (i) in
                let item = ProductModel(object: i)
                self.arrProduct.append(item)
            }
            self.arrTemp = self.arrProduct
            colectionView.reloadData()
        }
    }
    
    @objc private func searchPro(_ sender: UIButton){
        if time != nil{
            time.invalidate()
        }
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerSearch), userInfo: nil, repeats: false)
        
    }
    @objc private func timerSearch(){
        arrProduct = []
        //uppercased: chu hoa, lowercased
        arrTemp.forEach { (i) in
            if i.productName.uppercased().contains(toolBar.searchView.edtSearch.text!.uppercased()){
                arrProduct.append(i)
            }
        }
        if toolBar.searchView.edtSearch.text! == ""{
            arrProduct = arrTemp
        }
        colectionView.reloadData()
    }
    
    //MARK: TOOLBAR
    var toolBar: ToolbarHeader = {
        let toolBar = ToolbarHeader()
        return toolBar
    }()
    
    func setUpToolBar() {
        view.addSubview(toolBar)
        toolBar.snp.makeConstraints { make  in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(45)
        }
    }
    
    //MARK: HOM NAY BAN GI
    var tvTitle : UILabel = {
        let tvTitle = UILabel()
        tvTitle.textColor = .black
        tvTitle.text = "Hôm nay bán gì?"
        tvTitle.font = .systemFont(ofSize: 20)
        return tvTitle
    }()
    
    func setUpTitle() {
        view.addSubview(tvTitle)
        tvTitle.snp.makeConstraints { (make) in
            make.top.equalTo(toolBar.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview()
        }
    }
    
    //MARK: setup colection View
    lazy var colectionView : BaseCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colect = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
        colect.register(ProductViewCell.self, forCellWithReuseIdentifier: "ProductViewCell")
        colect.register(CategryViewCell.self, forCellWithReuseIdentifier: "CategryViewCell")
        colect.delegate = self
        colect.dataSource = self
        colect.backgroundColor = .white
        layout.scrollDirection = .vertical
        return colect
    }()
    
    func setUpColectView() {
        view.addSubview(colectionView)
        colectionView.snp.makeConstraints { (make) in
            //             if #available(iOS 11.0, *) {
            //                 make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            //             }else{
            //                 make.top.equalTo(topLayoutGuide.snp.top)
            //             }
            make.top.equalTo(tvTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
        }
    }
    //MARK: float action bar
    lazy var floatAction : GioHangController = {
        let floatA = GioHangController()
        floatA.backgroundView.addTarget(self, action: #selector(onClickItem), for: .touchUpInside)
        return floatA
    }()
    
    func showFloatAction() {
        view.addSubview(floatAction)
        floatAction.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-50)
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
    }
    //MARK: funtion
    private var is_show = false
    
    @objc func onClickItem() {
        if !is_show {
            print(is_show)
            self.floatAction.snp.updateConstraints { (make) in
                make.width.equalTo(150)
            }
        }else{
            print("a \(is_show)")
            self.floatAction.snp.updateConstraints { (make) in
                make.width.equalTo(60)
            }
        }
        is_show = !is_show
    }

}

extension DashBoardController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2 // chia ra 2 cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return arrProduct.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell:  CategryViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategryViewCell", for: indexPath) as! CategryViewCell
            cell.arrCate = arrCategory
            cell.colect.reloadData()
            return cell
            
        default:
            let cell:  ProductViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
            
            cell.displayCell(customer: arrProduct[indexPath.row])
            return cell
            
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: Dimension.shared.width_screen, height: 45)
        default:
            return CGSize(width: (Dimension.shared.width_screen / 2) - 20, height: 200)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    } // khoang cach giua 2 cell theo chieu tren duoi
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }// khoang cach giua 2 cell theo chieu trai phai
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    } // khoang cach giua colectionview so vs cha no
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1{
//            let vc = ProductDetailController()
//            vc.modalPresentationStyle = .fullScreen
//            vc.data = arrProduct[indexPath.row]
//            //self.PushVC(vc: vc)
//            navigationController?.navigationBar.isHidden = false
//            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
