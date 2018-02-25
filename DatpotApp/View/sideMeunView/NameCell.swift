//
//  NameCell.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 21/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    @IBOutlet weak var lineview: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
