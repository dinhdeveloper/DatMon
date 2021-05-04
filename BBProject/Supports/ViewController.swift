//
//  ViewController.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var spage = 1
    private var loadmore = true
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMusic.count > 0 ? arrMusic.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //adapter
        if arrMusic.count > 0 {
            let cell: CellCustomerManager = tableView.dequeueReusableCell(withIdentifier: "CellCustomerManager", for: indexPath) as! CellCustomerManager
            cell.contentView.isUserInteractionEnabled = false //--------------> ios 14.2
            cell.displayCell(customer: arrMusic[indexPath.row])
            return cell
        }
       return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailController()
        
        vc.modalPresentationStyle = .fullScreen
        vc.data = arrMusic[indexPath.row]
//        self.PushVC(vc: vc)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    var arrMusic: [MusicModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTable()
        getListSong()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    lazy private var tableview : BaseTableView = {
        let tbv = BaseTableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tbv.register(CellCustomerManager.self, forCellReuseIdentifier: "CellCustomerManager")
        tbv.estimatedRowHeight = 60
        tbv.rowHeight = UITableViewAutomaticDimension
        tbv.backgroundColor = .white
        tbv.delegate = self
        tbv.dataSource = self
        tbv.separatorStyle = .singleLine
        return tbv
    }()
    
    func setUpTable() {
        view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
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
            tableview.reloadData()
        }
    }


}

