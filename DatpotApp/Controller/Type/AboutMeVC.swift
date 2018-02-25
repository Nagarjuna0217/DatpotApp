//
//  AboutMeVC.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 19/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class AboutMeVC: UIViewController {

    @IBOutlet weak var aboutMeTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutMeTextView.layer.cornerRadius = 20.0
        self.aboutMeTextView.clipsToBounds = true
        
        self.aboutMeTextView?.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func proceedAtc(_ sender: Any) {
        
        let paasword = self.storyboard?.instantiateViewController(withIdentifier: "photoVC") as! photoVC
        self.navigationController?.pushViewController(paasword, animated: true)
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
