//
//  File.swift
//  eTheraphyPro
//
//  Created by Batth on 09/09/17.
//  Copyright © 2017 Batth. All rights reserved.
//

import Foundation
import UIKit

extension UIColor
{
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
extension UIView{
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func setShadow(_ radius: CGFloat, _ opacity: Float,_ color: UIColor,_ offset: CGSize){
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
    
    func addConstraintsToView(visualString: String, views:UIView...){
        
        var keyDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            keyDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualString, options: [], metrics: [:], views: keyDictionary))
    }
    
        var safeTopAnchor: NSLayoutYAxisAnchor {
            if #available(iOS 11.0, *) {
                return safeAreaLayoutGuide.topAnchor
            } else {
                return topAnchor
            }
        }
        
        var safeBottomAnchor: NSLayoutYAxisAnchor {
            if #available(iOS 11.0, *) {
                return safeAreaLayoutGuide.bottomAnchor
            } else {
                
                return layoutMarginsGuide.bottomAnchor
            }
        }
    
}
extension UIImageView {
    
    func setRounded() {
    ///    let radius = CGRectGetWidth(self.frame) / 2
        self.layer.cornerRadius = (self.frame.width / 2) //instead of
        self.layer.masksToBounds = true
    }
}
extension UIViewController{
    
//MARK:-  Alerts
    
    func showAlert(_ title: String, _ message:String,_ buttonTitle:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { (action: UIAlertAction) in
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertMoreThanOneButton(_ title: String?, _ message: String?, actions:UIAlertAction...){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions{
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
    }
    
    func action(_ title: String, action:@escaping (_ alertAction: UIAlertAction) -> Void) -> UIAlertAction{
        let btnAction = UIAlertAction(title: title, style: .default, handler:action)
        return btnAction
    }
    
    
////MARK:-  Webservices
//    func webServices(_ method: String, _ parameters: Dictionary<String, String>?, success:@escaping (_ response: Any) -> Void, jsonError:@escaping (_ error: Error?) -> Void){
//        
//        let baseUrl = "\(Constants.baseUrl)\(method)"
//        print(parameters)
//        let url = URL(string: baseUrl)
//        var request = URLRequest(url: url!)
//        request.httpMethod = "POST"
//        if let parameter = parameters {
//            do{
//                request.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
//
//            }catch let err{
//                print(err)
//            }
//        }
//        let sessionConfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
//        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
//            if error == nil{
//                if let jsonData = data{
//                    do {
//                        let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
//                        success(json)
//                    }catch let jsonErr{
//                        print(jsonErr)
//                        jsonError(jsonErr)
//                    }
//                }else{
//                    
//                }
//            }else{
//                jsonError(error)
//            }
//        }
//        dataTask.resume()
//    }
//    
//    func webServicesString(_ method: String, _ parameters: String?, success:@escaping (_ response: Any) -> Void, jsonError:@escaping (_ error: Error?) -> Void){
//        
//        let baseUrl = "\(Constants.baseUrl)\(method)"
//        print(baseUrl)
//        let url = URL(string: baseUrl)
//        var request = URLRequest(url: url!)
//        request.httpMethod = "POST"
//        request.httpBody = parameters?.data(using: .utf8)
//        
//        let sessionConfiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
//        let dataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
//            
//            if error == nil{
//                if let jsonData = data{
//                    do {
//                        let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
//                        success(json)
//                    }catch let jsonErr{
//                        print(jsonErr)
//                        jsonError(jsonErr)
//                    }
//                }else{
//                    
//                }
//            }else{
//                jsonError(error)
//            }
//        }
//        dataTask.resume()
//    }
//
////MARK:-  Validation
//    
//    func isValidEmail(testStr:String) -> Bool {
//        // print("validate calendar: \(testStr)")
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        
//        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailTest.evaluate(with: testStr)
//    }
//    
////MARK:-  HUD
//    func showHud() {
//        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
//        hud.isUserInteractionEnabled = false
//    }
//    
//    func hideHUD() {
//        DispatchQueue.main.async {
//            MBProgressHUD.hide(for: self.view, animated: true)
//        }
//    }
    
    

}
