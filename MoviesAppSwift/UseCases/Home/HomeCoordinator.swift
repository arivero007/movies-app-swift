//
//  HomeCoordinator.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import UIKit

class HomeCoordinator: Coordinator{
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MoviesListViewController(nibName: "MoviesListViewController", bundle: nil)
        vc.coordinator = self
        vc.viewModel = MoviesListViewModel()
        navigationController.setViewControllers([vc], animated: false)
    }
    
    
}
