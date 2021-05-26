//
//  Coordinator.swift
//  Afya
//
//  Created by Daniel Oliveira on 25/05/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }

    func start()
}
