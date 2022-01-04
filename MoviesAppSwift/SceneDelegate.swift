//
//  SceneDelegate.swift
//  MoviesAppSwift
//
//  Created by AlexR on 4/1/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navVC = UINavigationController()
        coordinator = HomeCoordinator(navigationController: navVC)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        self.window = window
        coordinator?.start()
    }

}

