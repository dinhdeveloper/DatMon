//
//  BaseController.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView

protocol ResuableView {
    func initialize()
}

class vcBaseController: UIViewController, ResuableView {
    
    //MARK: UI ELements
    var activityIndicator : NVActivityIndicatorView?
    
    lazy var lblPopUPNotif : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .red
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        lbl.alpha = 1.0
        lbl.clipsToBounds = true
        return lbl
    }()
    //custom activityindicator
    func customActivity() {
        let xAxis = self.view.center.x // or use (view.frame.size.width / 2) // or use (faqWebView.frame.size.width / 2)
        let yAxis = self.view.center.y // or use (view.frame.size.height / 2) // or use (faqWebView.frame.size.height / 2)
        let frame = CGRect(x: (xAxis - Dimension.shared.BBWidth(width: 30)), y: (yAxis - Dimension.shared.BBHeight(height: 30)), width: (Dimension.shared.BBWidth(width: 60)), height: Dimension.shared.BBWidth(width: 60))
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator?.type = .ballRotateChase // add your type
        activityIndicator?.color = Theme.shared.main_color // add your color
        self.view.addSubview(activityIndicator ?? UIActivityIndicatorView())
    }
    private var popError = BaseViewPopUp()
    
    //MARK : View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initialize()
        customActivity()
        requestApi()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func initialize() {}
    func requestApi(){}
    
    //MARK: handle
    func customBackButtonWithoutTitle(title : String){
        let imgBackArrow = Resource.Images.shared.back1x
        navigationController?.navigationBar.backIndicatorImage = imgBackArrow
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBackArrow
        navigationItem.leftItemsSupplementBackButton = true
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.title = title
        let textAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedStringKey.font : UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 16))]
        navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedStringKey : Any]
    }
    // func load data
   
    
    func requestApi(param: Dictionary<String, Any>,completionHandler:@escaping (ResultResponse?)->()){
        activityIndicator?.startAnimating()
        let url = API.shared.baseUrl
        let headers = ["Authorization": Resource.Method.shared.authen]
        Alamofire.request(url, method: HTTPMethod.post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch(response.result) {
                case .success(_):
                    DispatchQueue.main.async {
                        let obj: AnyObject = response.value as AnyObject
                        let result = ResultResponse(object: obj)
                        self.activityIndicator?.stopAnimating()
                        completionHandler(result)
                    }
                    
                break
            case .failure(_):
                
                DispatchQueue.main.async {
                    self.activityIndicator?.stopAnimating()
                    print("error: \(response.description)")
                    if response.description.contains("Alamofire.AFError.ResponseSerializationFailureReason.inputDataNilOrZeroLength"){
                        self.popError.showPopUp(parentView: self.view, mess: "Bad Json", title: Resource.Title.shared.title_error, type: TYPE_POPUP.ERROR)
                        self.popError.btnOK.addTarget(self, action: #selector(self.actionHidePop(_:)), for: .touchUpInside)
                    }else{
                        self.popError.showPopUp(parentView: self.view, mess: "The Internet connection appears to be offline.", title: "The request timed out", type: TYPE_POPUP.ERROR)
                        self.popError.btnOK.addTarget(self, action: #selector(self.actionHidePop(_:)), for: .touchUpInside)
                    }

                }
                break
            }
        }
    }
    @objc func actionHidePop(_ sender: UIButton){
        popError.removeFromSuperview()
    }
    
    // show popup
    func showPopUpNotif(_title: String){
        lblPopUPNotif.alpha = 1.0
        self.addViewAlertNotif(title: _title)
        UIView.animate(withDuration: 0.5, delay: 2, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.lblPopUPNotif.alpha = 0.0
        }, completion: nil)
        
    }
    //show popup success
    func showPopUpNotifSuccess(_title: String){
        lblPopUPNotif.backgroundColor = Theme.shared.greenColor
        lblPopUPNotif.alpha = 1.0
        self.addViewAlertNotif(title: _title)
        UIView.animate(withDuration: 0.5, delay: 2, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            self.lblPopUPNotif.alpha = 0.0
        }, completion: nil)
        
    }
    
    //MARK: setup view
    // add view thông bao
    func addViewAlertNotif(title: String){
        view.addSubview(lblPopUPNotif)
        lblPopUPNotif.text = title
        lblPopUPNotif.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            } else {
                make.top.equalTo(topLayoutGuide.snp.top)
            }
            make.height.equalTo(Dimension.shared.BBHeight(height: 64))
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            
        }
    }
    //show alert
    func showAlert(title : String){
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        alert.setValue(NSAttributedString(string: title, attributes: [NSAttributedStringKey.font : UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 16)) ?? UIFont()]), forKey: "attributedTitle")
        let btnOK = UIAlertAction(title: Resource.Title.shared.cancel, style: .cancel, handler: nil)
        alert.addAction(btnOK)
        present(alert, animated: true, completion: nil)
    }
    
    //setup push notification
    func setupPusNotification(toUserID: String, body:String, titleNotif:String, click_action: String){
        let notification_url = "https://fcm.googleapis.com/fcm/send"
        let serverKey = "AAAAAMwIRVM:APA91bE6CeLUe93OTDJJHHTAxS4yqYiLppuadN9n5k3J6N7JUfa9d_svNk0JoB1eyANLu0JyGQZ7J7nd_dikDzh7JbZCIKlycvRQGnsDX6vB6y0e7_zq3b1qIgMO1cXVca00uS9V-KaJ"
        let title = titleNotif
        let body = body
        let toUserId = toUserID
        var header:HTTPHeaders = HTTPHeaders()
        //"Bài đăng của bạn trên Aladin đã được duyệt, vui lòng đăng nhập vào app để kiểm tra thông tin"
        header = ["Content-Type":"application/json", "Authorization": "key=\(serverKey)"]
        let notification = ["to":"/topics/\(toUserId)", "priority" : "high","notification":["body": body, "title": title, "badge": 1,"sound":"default","click_action": click_action]] as [String:Any]
        Alamofire.request(notification_url as URLConvertible, method: .post as HTTPMethod, parameters: notification, encoding: JSONEncoding.default, headers: header)
        
    }
    
    func calculateHeight(inString:String, fonsize: CGFloat, width: CGFloat) -> CGFloat {
        let messageString = inString
        let attributes : [NSAttributedStringKey : Any] = [NSAttributedString.Key(rawValue: NSAttributedStringKey.font.rawValue) : UIFont(name: Resource.FontName.shared.general, size: Dimension.shared.BBFontsize(fsize: fonsize)) as Any]
        
        let attributedString = NSAttributedString(string: messageString, attributes: attributes)
        let rect : CGRect = attributedString.boundingRect(with: CGSize(width: Dimension.shared.width_screen - Dimension.shared.BBWidth(width: width), height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)
        
        let requredSize:CGRect = rect
        return requredSize.height
    }
}



//MARK: UI ELements


//MARK: View LifeCycle


//MARK: Load data

//MARK: Action


//MARK: Setup View

