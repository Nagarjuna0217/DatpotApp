//
//  NotificationsCell.swift
//  DatpotApp
//
//  Created by PROJECTDUDE on 23/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class NotificationsCell: UITableViewCell {
    @IBOutlet weak var grayView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.grayView.layer.cornerRadius = 8.0
        self.grayView  .clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
