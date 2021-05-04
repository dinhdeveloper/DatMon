//
//  Resource.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

public class Resource {
    
    class Method {
        public static var shared = Method()
        private init(){}
        let postMethod = "POST"
        let getMethod = "GET"
        let authen = "Basic YWRtaW46cXRjdGVrQDEyMwx=="
    }
    
    class Response {
        public static var shared = Response()
        private init(){}
        let data : String = "data"
        let success : String = "success"
        let success_true : String = "true"
        let success_false : String = "false"
        let message : String = "message"
    }
    class Images {
        public static var shared = Images()
        private init(){}
        let noImage : UIImage = UIImage()
        let photoDefault : UIImage = UIImage(named: "Unknown") ?? UIImage()
        let checkerror1 : UIImage = UIImage(named: "checkerror1x") ?? UIImage()
        let checksuccess : UIImage = UIImage(named: "checked_success1x") ?? UIImage()
        let back1x : UIImage = UIImage(named: "back") ?? UIImage()
        let arrow_point_down : UIImage = UIImage(named: "arrow-point-to-down1x") ?? UIImage()
        let user_avatar = UIImage(named: "user_avatar") ?? UIImage()
        var Icon_Job = UIImage(named: "Icon_Job") ?? UIImage()
        let warning_yellow = UIImage(named: "warning") ?? UIImage()
    }
    class FontName {
        public static var shared = FontName()
        private init(){}
        let bold_italic : String = "HelveticaNeue-BoldItalic"
        let bold : String = "HelveticaNeue-Bold"
        let italic : String = "HelveticaNeue-Italic"
        let general : String = "HelveticaNeue"
    }
    class Title {
        public static var shared = Title()
        private init(){}
        let cancel : String = "Thoát"
        let search : String = "Tìm kiếm"
        let title_error : String = "Thông báo"
        let title_success : String = "Thành công"
    }
    class Identifier {
        public static var shared = Identifier()
        private init(){}
        let cell_default : String = "CellDefault"
        let cell_slideMenu : String = "CellSlideMenu"
    }
    class NotificationName {
        public static var shared = NotificationName()
        private init(){}
        let select_item_slidemenu = "select_item_slidemenu"
    }
    class TitleAlert {
        public static var shared = TitleAlert()
        private init(){}
        let disconnect : String = "Mất kết nối Internet"
        let no_connect_server : String = "Có lỗi xảy ra vui lòng thử lại"
        let account_exist : String = "Tài khoản đã được đăng ký"
        let invalid_pw : String = "Sai mật khẩu"
        let phone_dont_exist : String = "Tài khoản không tồn tại"
    }
}
