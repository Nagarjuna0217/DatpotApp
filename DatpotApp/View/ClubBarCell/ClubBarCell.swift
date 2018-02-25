//
//  ClubBarCell.swift
//  DatpotApp
//
//  Created by Pavan Kumar Reddy on 17/02/18.
//  Copyright © 2018 Datspot. All rights reserved.
//

import UIKit

class ClubBarCell: UITableViewCell {

    @IBOutlet var bgImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
