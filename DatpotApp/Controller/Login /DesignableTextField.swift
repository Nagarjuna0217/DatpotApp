//
//  DesignableTextField.swift
//  Event_Dude
//
//  Created by rakeshkumar thammishetty on 06/02/18.
//  Copyright © 2018 Truzio. All rights reserved.
//

import UIKit
@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var leftImage: UIImage?{
        didSet {
            updateView()
        }
    }
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            let imageView = UIImageView(frame: CGRect(x: 7, y: 4, width: 20, height: 20))
            imageView.image = image
            
            let view = UIView(frame: CGRect(x: 15, y: 0, width: 30, height: 30))
            view.addSubview(imageView)
            leftView = view
        } else {
            // image is nil
        }
    }
}
