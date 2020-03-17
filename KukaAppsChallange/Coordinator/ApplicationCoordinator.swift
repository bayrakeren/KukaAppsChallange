//
//  ApplicationCoordinator.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let navigationController: UINavigationController
    let mainCoordinator: MainCoordinator
    let router: KukaAppsChallangeRouter
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController(rootViewController: UIViewController())
        self.router = KukaAppsChallangeRouter(navigationController: navigationController)
        self.mainCoordinator = MainCoordinator(presenter: router)
    }
    
    func start() {
        self.window.rootViewController = router.toShowable()
        self.mainCoordinator.start()
        self.window.makeKeyAndVisible()
    }
}
