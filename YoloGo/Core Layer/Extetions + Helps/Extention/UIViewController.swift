//
//  UIViewController.swift
//  YoloGo
//
//  Created by Tanirbergen Kaldibai on 16.12.2021.
//

import UIKit

extension UIViewController {
    func showAlert(alertString: String) {
        let alert = UIAlertController(title: "", message: alertString, preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 2.8
            DispatchQueue.main.asyncAfter(deadline: when){
              alert.dismiss(animated: true, completion: nil)
        }
    }
}
