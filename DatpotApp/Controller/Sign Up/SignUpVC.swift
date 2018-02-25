//
//  SignUpVC.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 14/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var usernameTF: DesignableTextField!
    @IBOutlet weak var passwordTF: DesignableTextField!
    
    @IBOutlet weak var comfirmPasswordTF: DesignableTextField!
    @IBOutlet weak var emailTF: DesignableTextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.emailTF.layer.cornerRadius = 20.0
        self.emailTF.clipsToBounds = true
        self.passwordTF.layer.cornerRadius = 20.0
        self.passwordTF.clipsToBounds = true
        self.comfirmPasswordTF.layer.cornerRadius = 20.0
        self.comfirmPasswordTF.clipsToBounds = true
        self.usernameTF.layer.cornerRadius = 20.0
        self.usernameTF.clipsToBounds = true
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func signUpATC(_ sender: Any) {
        
        view.endEditing(true)
        view.resignFirstResponder()
        
        if usernameTF.text?.count == 0 {
            self.showAlert("Error!", "Please enter username.", "OK")
            return
        }
        
        if passwordTF.text?.count == 0 {
            self.showAlert("Error!", "Please enter password.", "OK")
            return
        }
        if comfirmPasswordTF.text?.count == 0 {
            self.showAlert("Error!", "Please enter password.", "OK")
            return
        }
        
        if emailTF.text?.count == 0 {
            self.showAlert("Error!", "Please enter Email.", "OK")
            return
        }
        let paasword = self.storyboard?.instantiateViewController(withIdentifier: "DiscoverVC") as! DiscoverVC
        self.navigationController?.pushViewController(paasword, animated: true)
        
        
    }
    
    @IBAction func alreadyATC(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
   
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
