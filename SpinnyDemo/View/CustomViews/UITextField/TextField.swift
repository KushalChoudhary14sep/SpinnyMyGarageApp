//
//  TextField.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation
import UIKit

class TextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)
    let dropDown = UIButton(type: UIButton.ButtonType.system)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: self.frame.width - 50, bottom: 0, right: 0))
    }
    
    @objc func setTextFieldRightView() {
        self.rightView = dropDown
        self.rightViewMode = .always
        self.rightView?.isHidden = false
        self.rightView?.frame.size = CGSize(width: 15, height: 15)
        self.dropDown.isUserInteractionEnabled = false
        let showImage: UIImage = UIImage(named: "dropDown") ?? UIImage()
        dropDown.setImage( showImage, for: .normal)
        dropDown.imageView?.contentMode = .scaleAspectFit
    }
}
