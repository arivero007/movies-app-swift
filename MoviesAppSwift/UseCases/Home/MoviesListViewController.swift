//
//  MoviesListViewController.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import UIKit

class MoviesListViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var viewModel: MoviesListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
    }


}
