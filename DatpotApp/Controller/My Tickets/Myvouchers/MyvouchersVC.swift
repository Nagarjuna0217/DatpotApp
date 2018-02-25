//
//  MyvouchersVC.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 23/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class MyvouchersVC:TabBarParentVC,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var MyticketsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /// MyticketsTableView.separatorStyle = .none
        self.navigationController?.navigationBar.barTintColor = .black;
           print(UIFont.familyNames)
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "Alpha Echo", size: 25)!,
                                                                         NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.navigationItem.title = "My vouchers"
        print(UIFont.familyNames)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell: MyVouchersCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? MyVouchersCell
        if cell == nil {
            tableView.register(UINib(nibName: "MyVouchersCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MyVouchersCell
            
            
        }
        
        cell.selectionStyle = .none
        
        return cell
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
func printFonts() {
    for familyName in UIFont.familyNames {
        print("\n-- \(familyName) \n")
        for fontName in UIFont.fontNames(forFamilyName: familyName) {
            print(fontName)
        }
    }
}

