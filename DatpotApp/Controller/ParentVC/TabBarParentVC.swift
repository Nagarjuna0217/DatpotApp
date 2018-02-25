//
//  ParentVC.swift
//  DatpotApp
//
//  Created by Pavan Kumar Reddy on 17/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class TabBarParentVC: ParentViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        let leftbtn = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: .done, target: self, action: #selector(openLeftMenu))
        self.navigationItem.leftBarButtonItem = leftbtn
    }
    
    @objc  func openLeftMenu()
    {
        self.slideMenuController()?.openLeft()
    }
    
   
}
