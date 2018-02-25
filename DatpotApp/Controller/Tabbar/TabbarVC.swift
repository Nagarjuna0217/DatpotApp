//
//  TabbarVC.swift
//  DatpotApp
//
//  Created by Pavan Kumar Reddy on 17/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController , UITabBarControllerDelegate  {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.delegate = self
        
        //1
        let datSpotList = HomeVC()
        let nav1 = UINavigationController()
        nav1.navigationBar.barTintColor = UIColor.black
        nav1.viewControllers = [datSpotList]
        let date = UITabBarItem.init(title: "Home", image: #imageLiteral(resourceName: "home"), tag: 0)
        datSpotList.tabBarItem = date
        
        //2
        let discoverVC = DiscoverTabVC()
        let nav2 = UINavigationController()
        nav2.navigationBar.barTintColor = UIColor.black
        nav2.viewControllers = [discoverVC]
        let  item2 = UITabBarItem.init(title: "Discover", image: #imageLiteral(resourceName: "discover"), tag: 0)
        discoverVC.tabBarItem = item2
        
        //3
        let messagesVC = MessagesVC()
        let nav3 = UINavigationController()
        nav3.navigationBar.barTintColor = UIColor.black
        nav3.viewControllers = [messagesVC]
        let  item3 = UITabBarItem.init(title: "Messages", image: #imageLiteral(resourceName: "message"), tag: 0)
        messagesVC.tabBarItem = item3
        
        //4
        let profileVC = ProfileVC()
        let nav4 = UINavigationController()
        nav4.navigationBar.barTintColor = UIColor.black
        nav4.viewControllers = [profileVC]
        let  item4 = UITabBarItem.init(title: "Profile", image: #imageLiteral(resourceName: "profile"), tag: 0)
        profileVC.tabBarItem = item4
        
        let newVCObj = newVC()
        let nav44 = UINavigationController()
        nav44.navigationBar.barTintColor = UIColor.black
        nav44.viewControllers = [newVCObj]
        let  item44 = UITabBarItem.init(title: " ", image: nil, tag: 0)
        newVCObj.tabBarItem = item44
        
        //DatSpot
            let btn = UIButton.init(type: .system)
            btn.frame = CGRect.init(x: kWidth/2-45, y: kHeight-90, width: 90, height: 110)
            btn.setImage(#imageLiteral(resourceName: "datespot"), for: .normal)
            btn.setTitle("DatSpot", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
            btn.centerVertically(withPadding: 5)
              self.view.addSubview(btn)
            
            
            if !IS_IPAD
            {
                if kHeight >= 812
                {
                    //IPhoneX
                    btn.frame = CGRect.init(x: kWidth/2-45, y: kHeight-120, width: 90, height: 110)
                }
            }
        ///End
        
        self.viewControllers = [nav1,nav2,nav44,nav3,nav4]
        
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true;
    }
}
