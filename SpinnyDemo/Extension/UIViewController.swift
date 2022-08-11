//
//  UIViewController.swift
//  SpinnyDemo
//
//  Created by Kushal Choudhary on 09/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, comletion : (() -> Void)?)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            comletion?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func presentVC(storyBoard: String, identifier: String ) {
        let secondVC = UIStoryboard(name: storyBoard, bundle: nil).instantiateViewController(identifier: identifier)
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
        self.present(secondVC, animated: true, completion: nil)
    }
    
    func showToast(message: String) {
        guard let window = UIApplication.shared.currentUIWindow() else {
            return
        }
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 16)
        toastLbl.textColor = UIColor.white
        toastLbl.backgroundColor = UIColor.black
        toastLbl.numberOfLines = 0
        let textSize = toastLbl.intrinsicContentSize
        let labelHeight = ( textSize.width / window.frame.width ) * 30
        let labelWidth = window.frame.width - 100
        let adjustedHeight = max(labelHeight, textSize.height + 30)
        toastLbl.frame = CGRect(x: 20, y: (window.frame.height - 50 ) - adjustedHeight, width: labelWidth, height: adjustedHeight)
        toastLbl.center.x = window.center.x
        toastLbl.layer.cornerRadius = 10
        toastLbl.layer.masksToBounds = true
        window.addSubview(toastLbl)
        UIView.animate(withDuration: 3.0, animations: {
            toastLbl.alpha = 0
        }) { (_) in
            toastLbl.removeFromSuperview()
        }
    }
}
