//
//  DetailCoordinator.swift
//  TestCoordinator
//
//  Created by 김재영 on 9/18/25.
//

import UIKit

class DetailCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    private let fruitName: String

    init(navigationController: UINavigationController, fruitName: String) {
        self.navigationController = navigationController
        self.fruitName = fruitName
    }

    func start() {
        let detailVC = DetailViewController(fruitName: fruitName)
        navigationController.pushViewController(detailVC, animated: true)
    }
}
