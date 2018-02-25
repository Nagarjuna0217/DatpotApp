//
//  LeftViewController.swift
//  DatpotApp
//
//  Created by Pavan Kumar Reddy on 17/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class LeftViewController: ParentViewController , UITableViewDataSource , UITableViewDelegate {
    
    
    let imageNames = ["My Profile","My Tickets","My Vouchers", "My Friends", "Find Friends"]
    let catName = ["CLUB/BARS", "FESTIVALS","FOOD", "SHOWS","COMEDY","CLUB/BARS", "SPORTS","ACTIVITIES"]
    
    let cellIdentifier = "Cell"
    let headerIdentifier = "HeaderCell"
  let NameHeaderCell = "NameHeaderCell"
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.addSubview(tblClubBars)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-drwr")!)
        
        NSLayoutConstraint.activate([
            tblClubBars.topAnchor.constraint(equalTo: view.topAnchor , constant:0),
            tblClubBars.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tblClubBars.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tblClubBars.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
            ])
    }
    
    
    //func numberOfSectionsInTableView(tableView: UITableView) -> Int 
    //{
      //  return 2 // you should probably return 1
    //}
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    if section == 0
    {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerIdentifier) as! HeaderSideMeun
        headerCell.notBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
      
        return headerCell
    }else{
        let headerCell = tableView.dequeueReusableCell(withIdentifier: NameHeaderCell) as! NameHeaderCell
        return headerCell
        }
        
        return nil
        
    }
    @objc func buttonPressed(_ sender: UIButton) {
        
        let leftViewController = LeftViewController()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "NotificationsVC")                //homeNav.navigationBar.barTintColor = UIColor.black
        let homeNav = UINavigationController.init(rootViewController: initialViewController)
        let slideMenuController = ExSlideMenuController(mainViewController: homeNav, leftMenuViewController: leftViewController)
        let transition = getAnimation()
        self.navigationController!.view.layer.add(transition, forKey: nil)
        self.navigationController!.pushViewController(slideMenuController, animated: false)
    }
    //MARK:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
           return imageNames.count
        }
        else
        {
            return catName.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0
        {
            return 191
        }else{
            return 44

        }
        
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NameCell
        
        if indexPath.section  == 0
        {
            cell.nameLabel.text = imageNames[indexPath.row]
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            
            cell.lineview.isHidden = true
        }else{
            cell.nameLabel.text = catName[indexPath.row]
            cell.selectionStyle = .none
            
            cell.backgroundColor = .clear
            cell.lineview.isHidden = false

            if indexPath.row == catName.count-1{
              cell.lineview.isHidden = true
            }else{
                 cell.lineview.isHidden = false
            }
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section  == 0 {
            
            if indexPath.row == 0
            
            {
                let leftViewController = LeftViewController()
                let ProfileVC = TabbarVC()
              
                //let homeNav = UINavigationController.init(rootViewController: homeVC)
                //homeNav.navigationBar.barTintColor = UIColor.black
                
                let slideMenuController = ExSlideMenuController(mainViewController: ProfileVC, leftMenuViewController: leftViewController)
                  ProfileVC.selectedIndex = 4
                let transition = getAnimation()
                self.navigationController!.view.layer.add(transition, forKey: nil)
                self.navigationController!.pushViewController(slideMenuController, animated: false)
            }
            if indexPath.row == 1
                
            {
                let leftViewController = LeftViewController()
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                              let initialViewController = storyboard.instantiateViewController(withIdentifier: "MyTicketsVC")                //homeNav.navigationBar.barTintColor = UIColor.black
                let homeNav = UINavigationController.init(rootViewController: initialViewController)
                let slideMenuController = ExSlideMenuController(mainViewController: homeNav, leftMenuViewController: leftViewController)
                let transition = getAnimation()
                self.navigationController!.view.layer.add(transition, forKey: nil)
                self.navigationController!.pushViewController(slideMenuController, animated: false)
            }
            if indexPath.row == 2
                
            {
                let leftViewController = LeftViewController()

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let initialViewController = storyboard.instantiateViewController(withIdentifier: "MyvouchersVC")                //homeNav.navigationBar.barTintColor = UIColor.black
                    let homeNav = UINavigationController.init(rootViewController: initialViewController)
                let slideMenuController = ExSlideMenuController(mainViewController: homeNav, leftMenuViewController: leftViewController)
                let transition = getAnimation()
                self.navigationController!.view.layer.add(transition, forKey: nil)
                self.navigationController!.pushViewController(slideMenuController, animated: false)
            }
            if indexPath.row == 3
                
            {
                let leftViewController = LeftViewController()
                let ProfileVC = TabbarVC()
                
           
                
                let slideMenuController = ExSlideMenuController(mainViewController: ProfileVC, leftMenuViewController: leftViewController)
                ProfileVC.selectedIndex = 1
                let transition = getAnimation()
                self.navigationController!.view.layer.add(transition, forKey: nil)
                self.navigationController!.pushViewController(slideMenuController, animated: false)
            }
            if indexPath.row == 4
                
            {
                let leftViewController = LeftViewController()
                let ProfileVC = TabbarVC()
                
                //let homeNav = UINavigationController.init(rootViewController: homeVC)
                //homeNav.navigationBar.barTintColor = UIColor.black
                
                let slideMenuController = ExSlideMenuController(mainViewController: ProfileVC, leftMenuViewController: leftViewController)
                ProfileVC.selectedIndex = 3
                let transition = getAnimation()
                self.navigationController!.view.layer.add(transition, forKey: nil)
                self.navigationController!.pushViewController(slideMenuController, animated: false)
            }
        }else{
            let leftViewController = LeftViewController()
            let ProfileVC = TabbarVC()
            
            //let homeNav = UINavigationController.init(rootViewController: homeVC)
            //homeNav.navigationBar.barTintColor = UIColor.black
            
            let slideMenuController = ExSlideMenuController(mainViewController: ProfileVC, leftMenuViewController: leftViewController)
            ProfileVC.selectedIndex = 3
            let transition = getAnimation()
            self.navigationController!.view.layer.add(transition, forKey: nil)
            self.navigationController!.pushViewController(slideMenuController, animated: false)
        }
    }
    
    
    
  
    //MARK:- Global methods
    lazy var tblClubBars:UITableView = {
        let table =  self.getTableView(tblStyle: .grouped)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.clear
        table.separatorStyle = .none
        table.register(UINib(nibName: "NameCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        table.register(UINib(nibName: "HeaderSideMeun", bundle: nil), forCellReuseIdentifier: headerIdentifier)
            table.register(UINib(nibName: "NameHeaderCell", bundle: nil), forCellReuseIdentifier: NameHeaderCell)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    func getAnimation() -> CATransition
    {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        return transition
    }
}
