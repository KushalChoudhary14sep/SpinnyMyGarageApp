//
//  Button.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 10/08/22.
//

import Foundation
import UIKit

class Button: UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        cornerRadius = 5.0
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
