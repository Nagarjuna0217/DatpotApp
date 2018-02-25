//
//  newVC.swift
//  DatpotApp
//
//  Created by Pavan Kumar Reddy on 17/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class newVC: TabBarParentVC,UITableViewDelegate,UITableViewDataSource {

    let cellIdentifier = "ClubBarCell"
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupMenuBar()
        self.view.addSubview(tblClubBars)
        
        NSLayoutConstraint.activate([
            tblClubBars.topAnchor.constraint(equalTo: menuBar.bottomAnchor , constant:0),
            tblClubBars.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tblClubBars.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tblClubBars.bottomAnchor.constraint(equalTo: view.safeBottomAnchor)
            ])
    }
    
    //MARK:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ClubBarCell
        return cell
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
            menuBar.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    //MARK:- Global methods
    lazy var tblClubBars:UITableView = {
        let table =  self.getTableView(tblStyle: .plain)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        return table
    }()
}

