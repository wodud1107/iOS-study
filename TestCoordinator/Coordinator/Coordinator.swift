//
//  Coordinator.swift
//  TestCoordinator
//
//  Created by 김재영 on 9/18/25.
//

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
