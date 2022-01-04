//
//  Coordinator.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import UIKit

protocol Coordinator: AnyObject{
    var navigationController: UINavigationController { get set}
    var childCoordinators: [Coordinator] { get }
    
    func start()
}

protocol Coordinating{
    var coordinator: Coordinator? {get set}
}
