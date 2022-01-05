//
//  UIViewController+Extensions.swift
//  MoviesAppSwift
//
//  Created by AlexR on 5/1/22.
//

import UIKit

extension UIViewController{
    open func showAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
