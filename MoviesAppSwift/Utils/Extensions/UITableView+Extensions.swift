//
//  UITableView+Extensions.swift
//  MoviesAppSwift
//
//  Created by AlexR on 5/1/22.
//

import UIKit

extension UITableView{
    func showFooterSpinner(view: UIView){
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        
        let spinner = UIActivityIndicatorView()
        spinner.center = footer.center
        footer.addSubview(spinner)
        spinner.startAnimating()
        
        self.tableFooterView = footer
    }
}
