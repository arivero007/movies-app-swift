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
        let vc = MoviesListViewController(nibName: "MoviesListViewController", bundle: Bundle.main)
        vc.coordinator = self
        vc.viewModel = MoviesListViewModel(service: MoviesManager())
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func presentView(with data: Any, view: PushView) {
        switch view {
        case .homeView:
            print("Presenting HomeView")
        case .detailView:
            let vc = MovieDetailViewController(nibName: "MovieDetailViewController", bundle: Bundle.main)
            vc.coordinator = self
            vc.viewModel = MovieDetailViewModel(movie: data as! Movie)
            navigationController.pushViewController(vc, animated: true)
        }
    }
    
}
