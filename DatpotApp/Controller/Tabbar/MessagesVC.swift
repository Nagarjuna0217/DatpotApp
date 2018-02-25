//
//  MessagesVC.swift
//  DatpotApp
//
//  Created by Pavan Kumar Reddy on 17/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class MessagesVC: TabBarParentVC,UITableViewDataSource,UITableViewDelegate  {
    var segment = UISegmentedControl()
    let cellIdentifier = "FriendReqCell"
       let OnlineCell = "OnlineCell"
        var table = UITableView()
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupMenuBar()
        self.view.addSubview(tblClubBars)
         segment = UISegmentedControl(items: ["FRIENDS", "ONLINE"])
        segment.sizeToFit()
        
        
        
        segment.layer.borderColor = UIColor.clear.cgColor
        segment.tintColor = UIColor(red: (231/255.0), green:(50/255.0), blue:(128/255.0), alpha:1.00)
        segment.selectedSegmentIndex = 0;
        segment.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name:"Gotham Rounded", size: 12)!],
                                       for: UIControlState.normal)
        self.navigationItem.titleView = segment
        segment.addTarget(self, action: #selector(segmentedControlValueChanged), for:.touchUpInside)

        let rightBtn = UIBarButtonItem.init(image: #imageLiteral(resourceName: "not"), style: .done, target: self, action: #selector(openLeftMenu))
        self.navigationItem.rightBarButtonItem = rightBtn
        
        NSLayoutConstraint.activate([
            tblClubBars.topAnchor.constraint(equalTo: menuBar.bottomAnchor , constant:0),
            tblClubBars.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tblClubBars.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tblClubBars.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
            ])
    }
    @objc  func segmentedControlValueChanged() {
        if segment.selectedSegmentIndex == 0 {
            table.reloadData()
            
        }else{
            table.reloadData()

        }
        
    
    }
    @objc  override func openLeftMenu()
    {
      ///  let leftViewController = LeftViewController()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "NotificationsVC")                //homeNav.navigationBar.barTintColor = UIColor.black
        ///let homeNav = UINavigationController.init(rootViewController: initialViewController)
//        let slideMenuController = ExSlideMenuController(mainViewController: homeNav, leftMenuViewController: leftViewController)
//        let transition = getAnimation()
//        self.navigationController!.view.layer.add(transition, forKey: nil)
        self.navigationController!.pushViewController(initialViewController, animated: false)
    }
    
    
    //MARK:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    {
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FriendReqCell

        if segment.selectedSegmentIndex == 0 {
            if  indexPath.row == 0{
                let identifier = "FriendReqCell"
                var cell: FriendReqCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? FriendReqCell
                if cell == nil {
                    tableView.register(UINib(nibName: "FriendReqCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? FriendReqCell
                    
                    
                }
                    cell.selectionStyle = .none
            return cell
            }else{
                let identifier = "MessageCell"
                var cell: MessageCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? MessageCell
                if cell == nil {
                    tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: identifier)
                    cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MessageCell
                    
                    
                }
                        cell.selectionStyle = .none
                return cell
                
            
            }

        }else{
            let identifier = "OnlineCell"
            var cell: OnlineCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? OnlineCell
            if cell == nil {
                tableView.register(UINib(nibName: "OnlineCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? OnlineCell
                
                
            }
                    cell.selectionStyle = .none
            return cell
            
        }
    
    }
    
    let menuBar:MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    func setupMenuBar()
    {
        self.view.addSubview(menuBar)
        NSLayoutConstraint.activate([
            menuBar.topAnchor.constraint(equalTo: view.safeTopAnchor),
            menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuBar.heightAnchor.constraint(equalToConstant: 0)
            ])
    }
    func getAnimation() -> CATransition
    {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        return transition
    }
    //MARK:- Global methods
    lazy var tblClubBars:UITableView = {
         table =  self.getTableView(tblStyle: .plain)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
           table.register(UINib(nibName: OnlineCell, bundle: nil), forCellReuseIdentifier: OnlineCell)
        table.register(UINib(nibName: OnlineCell, bundle: nil), forCellReuseIdentifier: OnlineCell)

        return table
    }()
}
