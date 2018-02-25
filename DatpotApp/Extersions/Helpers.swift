//
//  Helpers.swift
//  eTheraphyPro
//
//  Created by Batth on 11/09/17.
//  Copyright © 2017 Batth. All rights reserved.
//

import Foundation
import UIKit

class Helpers: NSObject {
    
//Create Singleton
    static let sharedInstance = Helpers()
    
    
//MARK:-  Public Properties to Save Data
    var login : Bool!{
        didSet{
            if login {
                loginSave()
            }else{
                logOut()
            }
        }
    }
    
    var save: Dictionary<String, Any>!{
        didSet{
            saveDataInUserDefault(save)
        }
    }
    
    var payment: Bool!{
        didSet{
            if payment {
                savePayment(true)
            }else{
                savePayment(false)
            }
        }
    }
    
//MARK:-  Public Functions To Get Data
    
    func getData() -> Dictionary<String, Any>?{
        
        if let data = UserDefaults.standard.value(forKey: "details") as? Data{
            let details = NSKeyedUnarchiver.unarchiveObject(with: data)
            return details as? Dictionary<String, Any>

        }
        return nil
    }
    
    func isLogin() -> Bool{
        let loginCheck = UserDefaults.standard.bool(forKey: "isLogin")
        if loginCheck {
            return true
        }else{
            return false
        }
    }

    func isPaymentDone() ->  Bool{
        let paymentCheck = UserDefaults.standard.bool(forKey: "isPaymentDone")
        if paymentCheck {
            return true
        }else{
            return false
        }
    }
    
    
//MARK:-  Private Methods
    
    private func savePayment(_ payment: Bool){
        UserDefaults.standard.set(payment, forKey: "isPaymentDone")
        UserDefaults.standard.synchronize()
    }
    
    private func loginSave(){
        UserDefaults.standard.set(true, forKey: "isLogin")
        UserDefaults.standard.synchronize()
    }
    private func logOut() {
        UserDefaults.standard.removeObject(forKey: "isLogin")
        UserDefaults.standard.synchronize()
    }
    
    private func saveDataInUserDefault(_ dict: Dictionary<String,Any>){
        
        let data = NSKeyedArchiver.archivedData(withRootObject: dict)
        UserDefaults.standard.set(data, forKey: "details")
        UserDefaults.standard.synchronize()
    }
}


class BaseCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
