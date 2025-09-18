//
//  AppCoordinator.swift
//  TestCoordinator
//
//  Created by 김재영 on 9/18/25.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    private var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showListFlow()
    }

    func showListFlow() {
        let listCoordinator = ListCoordinator(navigationController: navigationController)
        listCoordinator.start()
        childCoordinators.append(listCoordinator)
    }
}
