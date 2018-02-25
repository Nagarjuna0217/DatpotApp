//
//  ParentViewController.swift
//  DatpotApp
//
//  Created by Pavan Kumar Reddy on 22/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:- TableView 
    func getTableView(tblStyle:UITableViewStyle) -> UITableView
    {
        let tableView:UITableView = UITableView(frame: .zero, style: tblStyle)
        tableView.backgroundColor = .black
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        return tableView
    }
    
}
