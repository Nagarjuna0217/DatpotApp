//
//  HeaderSideMeun.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 21/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class HeaderSideMeun: UITableViewCell {

    @IBOutlet weak var notBtn: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var sreachTF: DesignableTextField!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.sreachTF.layer.cornerRadius = 20.0
        self.sreachTF.clipsToBounds = true
        // Initialization code
        sreachTF.rightViewMode = UITextFieldViewMode.always
        let imageView = UIButton(frame: CGRect(x: 0, y: 0, width:55, height: 45))
        imageView.setTitle("GO", for: .normal)
        imageView.backgroundColor = UIColor.black
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        sreachTF.leftView = indentView
        sreachTF.leftViewMode = .always
        imageView.setTitleColor(.white, for: .normal)
        imageView.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        sreachTF.rightView = imageView
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
  

        // Configure the view for the selected state
    }
    
    @IBAction func notificationsAtc(_ sender: Any) {
        
        
//        let leftViewController = LeftViewController()
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        
//        let initialViewController = storyboard.instantiateViewController(withIdentifier: "NotificationsVC")                //homeNav.navigationBar.barTintColor = UIColor.black
//        let homeNav = UINavigationController.init(rootViewController: initialViewController)
//        let slideMenuController = ExSlideMenuController(mainViewController: homeNav, leftMenuViewController: leftViewController)
//        let transition = getAnimation()
//        self.navigationController!.view.layer.add(transition, forKey: nil)
//        self.navigationController!.pushViewController(slideMenuController, animated: false)
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
