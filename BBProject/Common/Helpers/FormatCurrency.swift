//
//  FormatCurrency.swift
//  BBProject
//
//  Created by QTCTEK COMP on 5/14/19.
//  Copyright © 2019 QTCTEK COMP. All rights reserved.
//

import UIKit

func FormatCurrency(str: String) -> String{
    var result:String = ""
    var d:Int64 = 0
    var millionString = ""
    
    if let currency: Int64 = Int64(str){
        if str.count >= 7{
            let billion = currency / 1000000000
            d = currency % 1000000000
            let million = d / 1000000
            if String(million).count == 3{
                millionString = String(million)
            }
            if String(million).count == 2{
                millionString = "0\(million)"
            }
            if String(million).count == 1{
                millionString = "00\(million)"
            }
            if billion > 0{
                let a =  (currency % 1000000) / 1000
                let b = (currency % 1000000) % 1000
                var astring : String = ""
                var bstring : String = ""
                if String(a).count == 3 {
                    astring = String(a)
                }else{
                    if String(a).count == 2 {
                        astring = "0\(a)"
                    }else{
                        astring = "00\(a)"
                    }
                }
                if String(b).count == 3{
                    bstring = String(b)
                }else{
                    if String(b).count == 2{
                        bstring = "0\(b)"
                    }else{
                        bstring = "00\(b)"
                    }
                }
                result = "\(billion).\(millionString).\(astring).\(bstring)"
                
            }else{
                let d1 = d % 1000000
                
                let tramngan = d1 / 1000
                let tram = d1 % 1000
                var tramnganstring : String = ""
                var tramstring : String = ""
                
                if String(tramngan).count == 3 {
                    tramnganstring = String(tramngan)
                }else{
                    if String(tramngan).count == 2 {
                        tramnganstring = "0\(tramngan)"
                    }else{
                        tramnganstring = "00\(tramngan)"
                    }
                }
                if String(tram).count == 3 {
                    tramstring = String(tram)
                }else{
                    if String(tram).count == 2 {
                        tramstring = "0\(tram)"
                    }else{
                        tramstring = "00\(tram)"
                    }
                }
                result = "\(million).\(tramnganstring).\(tramstring)"
                
            }
        }else{
            let a = currency / 1000
            let b = currency % 1000
            
            var bstring:String = ""
            if String(b).count == 3 {
                bstring = String(b)
            }else{
                if String(b).count == 2 {
                    bstring = "0\(b)"
                }else{
                    bstring = "00\(b)"
                }
            }
            
            if a > 0{
                result = "\(a).\(bstring)"
                
            }else{
                result = "\(b)"
            }
            
        }
        
        
    }else{
        result = "0.0"
    }
    return result
}


