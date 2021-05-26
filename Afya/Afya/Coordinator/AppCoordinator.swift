//
//  AppCoordinator.swift
//  Afya
//
//  Created by Daniel Oliveira on 25/05/21.
//

import UIKit

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators = [Coordinator]()
    
    private var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
