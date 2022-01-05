//
//  Coordinator.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import UIKit

enum PushView{
    case homeView
    case detailView
}

protocol Coordinator: AnyObject{
    var navigationController: UINavigationController { get set}
    var childCoordinators: [Coordinator] { get }
    
    func start()
    func presentView(with data: Any, view: PushView)
}

protocol Coordinating{
    var coordinator: Coordinator? {get set}
}
