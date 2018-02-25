//
//  ResetPasswordVC.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 14/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var emailTF: DesignableTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTF.layer.cornerRadius = 20.0
        self.emailTF.clipsToBounds = true
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetAtc(_ sender: Any) {
        if emailTF.text?.count == 0 {
            self.showAlert("Error!", "Please enter Email® .", "OK")
            return
        }
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func haveAccountAtc(_ sender: Any) {
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
