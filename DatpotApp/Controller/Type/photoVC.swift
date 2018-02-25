//
//  photoVC.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 16/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class photoVC: UIViewController {
    @IBOutlet weak var right1Image: UIImageView!
    @IBOutlet weak var left3imageView: UIImageView!
    @IBOutlet weak var spotLabel: UILabel!
    @IBOutlet weak var right2ImageView: UIImageView!
    @IBOutlet weak var centreImageView: UIImageView!
    @IBOutlet weak var left2ImageView: UIImageView!
    @IBOutlet weak var left1imageView: UIImageView!
    @IBOutlet weak var right3ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
right1Image.setRounded()
right2ImageView.setRounded()
        right3ImageView.setRounded()
        left1imageView.setRounded()
        left2ImageView.setRounded()
             left3imageView.setRounded()
             centreImageView.setRounded()
//        let attributedString = NSMutableAttributedString(string: "One last step before you \rfind your spot")
//        attributedString.addAttributes([
//            .font: UIFont(name: "Gotham-Bold", size: 15)!,
//            .foregroundColor: UIColor(red: 251.0 / 255.0, green: 86.0 / 255.0, blue: 136.0 / 255.0, alpha: 1.0)
//            ], range: NSRange(location: 36, length: 4))
//        
//        self.spotLabel.text = attributedString as? String
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueAtc(_ sender: Any) {
        
        self.gotodatspotListVC()
    }
 
    @IBAction func skipAtc(_ sender: Any) {
        
       // let paasword = self.storyboard?.instantiateViewController(withIdentifier: "MusicVC") as! MusicVC
      //  self.navigationController?.pushViewController(paasword, animated: true)
    }
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        
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


    func gotodatspotListVC()
    {
        let leftViewController = LeftViewController()
        let homeVC = TabbarVC()
        //let homeNav = UINavigationController.init(rootViewController: homeVC)
        //homeNav.navigationBar.barTintColor = UIColor.black
        
        let slideMenuController = ExSlideMenuController(mainViewController: homeVC, leftMenuViewController: leftViewController)
        
        let transition = getAnimation()
        self.navigationController!.view.layer.add(transition, forKey: nil)
        self.navigationController!.pushViewController(slideMenuController, animated: false)
    }
    
    func getAnimation() -> CATransition
    {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        return transition
    }
    
    
}

