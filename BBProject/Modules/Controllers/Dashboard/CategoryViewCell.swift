//
//  CategoryViewCell.swift
//  DatMon
//
//  Created by Trần Cảnh Dinh on 04/05/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit

class CategryViewCell: BaseCollectionCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var arrCate  : [CategoryModel] = []
    
    override func initialize() {
        
        setUpColectView()
        
    }
    
    lazy var colect : BaseCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colect = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
        colect.register(ItemCategoryCell.self, forCellWithReuseIdentifier: "ItemCategoryCell")
        colect.delegate = self
        colect.dataSource = self
        colect.backgroundColor = .white
        layout.scrollDirection = .horizontal
        
        return colect
    }()
    
    func setUpColectView() {
        addSubview(colect)
        colect.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(60)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrCate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:  ItemCategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCategoryCell", for: indexPath) as! ItemCategoryCell
        
        cell.displayCell(customer: arrCate[indexPath.row])
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    } // khoang cach giua 2 cell theo chieu tren duoi
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }// khoang cach giua 2 cell theo chieu trai phai
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    } // khoang cach giua colectionview so vs cha no
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var index = 0
        for i in 0..<arrCate.count {
            if i == indexPath.row {
                arrCate[i].checkChoose = true
                index = i
            }
            else{
                arrCate[i].checkChoose = false
            }
        }
        NotificationCenter.default.post(name: NSNotification.Name("CATE"), object: ["id": arrCate[index].categoryId, "arr": arrCate])
    }
}

