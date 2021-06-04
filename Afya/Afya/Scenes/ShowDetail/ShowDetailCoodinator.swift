//
//  ShowDetailCoodinator.swift
//  Afya
//
//  Created by Daniel Oliveira on 04/06/21.
//

import UIKit

final class ShowDetailCoordinator: Coordinator {
    private(set) var childCoordinators = [Coordinator]()
    
    private let navigationController:UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        let homeViewModel = HomeViewModel(serieService: SerieService())
        let showDetailViewController = ShowDetailViewController()
//        homeViewController.viewModel = homeViewModel
        self.navigationController.setViewControllers([showDetailViewController], animated: true)
    }
    
    

}
