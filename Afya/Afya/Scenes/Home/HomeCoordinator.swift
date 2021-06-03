//
//  HomeCoordinator.swift
//  Afya
//
//  Created by Daniel Oliveira on 25/05/21.
//

import UIKit

final class HomeCoordinator: Coordinator {
    private(set) var childCoordinators = [Coordinator]()
    
    private let navigationController:UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewModel = HomeViewModel(serieService: SerieService())
        let homeViewController = HomeViewController()
        homeViewController.viewModel = homeViewModel
        self.navigationController.setViewControllers([homeViewController], animated: true)
    }
    
    

}
