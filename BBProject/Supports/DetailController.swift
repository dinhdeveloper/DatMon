//
//  DetailController.swift
//  BBProject
//
//  Created by IOS DEV02 on 20/04/2021.
//  Copyright © 2021 QTCTEK COMP. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DetailController: UIViewController
{
   public var data = MusicModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(data.name)
        setUpColectView()
        getListSong()
    }
   
    var arrMusic: [MusicModel] = []
    
    
   lazy var colect : BaseCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let colect = BaseCollectionView(frame: .zero, collectionViewLayout: layout)
        colect.register(CellMusicColectionView.self, forCellWithReuseIdentifier: "CellMusicColectionView")
        colect.delegate = self
        colect.dataSource = self
        colect.backgroundColor = .white
        layout.scrollDirection = .horizontal
    
        return colect
    }()

    func setUpColectView() {
        view.addSubview(colect)
        colect.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }else{
                make.top.equalTo(topLayoutGuide.snp.top)
            }
            make.height.equalTo(240)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    func getListSong() {
        Alamofire.request("https://appmusic-test.herokuapp.com/song/list").responseJSON{ [self](res) in
            let object: AnyObject = res.value as AnyObject
            let dic: [AnyObject] = object as? [AnyObject] ?? []
            dic.forEach { (i) in
                let item = MusicModel(object: i)
                self.arrMusic.append(item)
            }
            colect.reloadData()
        }
    }
}

extension DetailController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMusic.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell:  CellMusicColectionView = collectionView.dequeueReusableCell(withReuseIdentifier: "CellMusicColectionView", for: indexPath) as! CellMusicColectionView
            cell.displayCell(customer: arrMusic[indexPath.row])
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    } // khoang cach giua 2 cell theo chieu tren duoi
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }// khoang cach giua 2 cell theo chieu trai phai
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    } // khoang cach giua colectionview so vs cha no
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrMusic[indexPath.row].name)
    }
}
