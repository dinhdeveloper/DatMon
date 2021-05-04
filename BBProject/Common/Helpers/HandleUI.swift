//
//  HandleUI.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit
import SDWebImage

public extension UIButton {
    
    func alignTextBelow(spacing: CGFloat = 6.0) {
        if let image = self.imageView?.image {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsetsMake(spacing, -imageSize.width, -(imageSize.height), 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: self.titleLabel!.font])
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0.0, 0.0, -titleSize.width)
        }
    }
    func alignImageRight() {
        if UIApplication.shared.userInterfaceLayoutDirection == .leftToRight {
            semanticContentAttribute = .forceRightToLeft
        }
        else {
            semanticContentAttribute = .forceLeftToRight
        }
    }
    
    func customButton(color: UIColor, radius:CGFloat, borderwidth:CGFloat,bodercolor:UIColor, titlecolor:UIColor){
        self.backgroundColor = color
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderwidth
        self.layer.borderColor = bodercolor.cgColor
        self.setTitleColor(titlecolor, for: .normal)
        self.titleLabel?.font = UIFont(name: Resource.FontName.shared.bold, size: Dimension.shared.BBFontsize(fsize: 16))
    }
    func shadowButton(width : CGFloat, height : CGFloat, opacity : Float, radius : CGFloat) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    func displayImgPhoto(urlPhoto : String) {
        if let url:URL = URL(string: urlPhoto) {
            self.sd_setImage(with:  url, for: .normal, completed: { (image, error, type, url) in
                if error == nil{
                    //self.image = image
                    self.setBackgroundImage(image, for: .normal)
                }
                else{
                    self.setBackgroundImage(Resource.Images.shared.photoDefault, for: .normal)
                }
            })
        }else{
            self.setBackgroundImage(Resource.Images.shared.photoDefault, for: .normal)
        }
    }
    func setImageColor(color: UIColor) {
        let templateImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(templateImage, for: .normal)
        self.imageView?.tintColor = color
    }
    
}

public extension UIImageView {
    
    func displayImgPhoto(urlPhoto : String, photo_default: UIImage) {
        if let url:URL = URL(string: urlPhoto) {
            self.sd_setImage(with: url, placeholderImage: photo_default, options: .delayPlaceholder, completed: nil)
        }else{
            self.image = photo_default
        }
    }
    
    func displayImgPhotoReturn(urlPhoto : String) -> UIImage {
        if let url:URL = URL(string: urlPhoto) {
            self.sd_setImage(with:  url, completed: { (image, error, type, url) in
                if error == nil{
                    self.image = image
                }
            })
            return self.image ?? UIImage()
        }
        return Resource.Images.shared.photoDefault
        
    }
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
}

extension String
{
    func trim() -> String
    {
        return self.replacingOccurrences(of: " ", with: "%20")
    }
    func trimPhone() -> String
    {
        return self.replacingOccurrences(of: " ", with: "")
    }
    func formatDate() -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let yourDate: Date = formatter.date(from: self){
            return yourDate
        }else{
            formatter.dateFormat = "yyyy-MM-dd"
            let yourDate: Date = formatter.date(from: self) ?? Date()
            return yourDate
        }
        
    }
    func formatDateTask() -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let yourDate: Date = formatter.date(from: self) ?? Date()
        return yourDate
    }
    func formatTime() -> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let yourDate: Date = formatter.date(from: self) ?? Date()
        return yourDate
    }
    
    
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return boundingBox.height
    }
}

extension Date{
    func formatDateTimeParam() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let d = formatter.string(from: self)
        return d
    }
    func formatDateParam() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let d = formatter.string(from: self)
        return d
    }
    func formatDateDisplay() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm"
        let d = formatter.string(from: self)
        return d
    }
    func formatDateDisplayTask() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm dd/MM/yyyy"
        let d = formatter.string(from: self)
        return d
    }
    
    func formatTime() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let d = formatter.string(from: self)
        return d
    }
    func formatDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let d = formatter.string(from: self)
        return d
    }
    func formatDateOption() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MM_yyyy"
        let d = formatter.string(from: self)
        return "M\(d)"
    }
    func formatDateCodeOrder() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        let d = formatter.string(from: self)
        return d
    }
}

extension UIView {
    func addshadow(width : CGFloat, height : CGFloat, opacity : Float, radius : CGFloat, color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
extension UITextField {
    func addDoneToolBar(){
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Xong", style: .plain, target: self, action: #selector(self.clickhideKeyboard))
        doneButton.tintColor = Theme.shared.blueColor
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.inputAccessoryView = toolBar
    }
    //an keyboard
    @objc func clickhideKeyboard(){
        self.endEditing(true)
    }
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}
extension UITextView {
    func addDoneToolBar(){
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Xong", style: .plain, target: self, action: #selector(self.clickhideKeyboard))
        doneButton.tintColor = Theme.shared.blueColor
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.inputAccessoryView = toolBar
    }
    //an keyboard
    @objc func clickhideKeyboard(){
        self.endEditing(true)
    }
}

extension UIColor {
       convenience init(hexString: String) {
           let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
           var int = UInt64()
           Scanner(string: hex).scanHexInt64(&int)
           let a, r, g, b: UInt64
           switch hex.count {
           case 3: // RGB (12-bit)
               (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
           case 6: // RGB (24-bit)
               (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
           case 8: // ARGB (32-bit)
               (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
           default:
               (a, r, g, b) = (255, 0, 0, 0)
           }
           self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
       }
}
