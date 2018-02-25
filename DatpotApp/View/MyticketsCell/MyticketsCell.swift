//
//  MyticketsCell.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 21/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class MyticketsCell: UITableViewCell {

    @IBOutlet weak var desLBl: UILabel!
    @IBOutlet weak var offerlabl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var redeemedBtn: UIButton!
    @IBOutlet weak var blackView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.blackView.layer.cornerRadius = 8.0
        self.blackView.clipsToBounds = true
        blackView.layer.borderWidth = 1
        
        blackView.layer.borderColor = UIColor.white.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
