//
//  ListCoordinator.swift
//  TestCoordinator
//
//  Created by 김재영 on 9/18/25.
//

import UIKit

protocol ListViewControllerDelegate {
    func showDetail(for fruit: String)
}

class ListCoordinator: Coordinator, ListViewControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let listVC = ListViewController()
        listVC.delegate = self
        navigationController.pushViewController(listVC, animated: false)
    }

    func showDetail(for fruit: String) {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController, fruitName: fruit)
        detailCoordinator.start()
        childCoordinators.append(detailCoordinator)
    }
}
