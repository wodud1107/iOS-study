//
//  SceneDelegate.swift
//  TestCoordinator
//
//  Created by 김재영 on 9/18/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        
        let appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator.start()
        
        self.window?.makeKeyAndVisible()
    }
}
