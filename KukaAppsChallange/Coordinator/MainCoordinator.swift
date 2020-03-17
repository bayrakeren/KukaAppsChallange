//
//  MainCoordinator.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

class MainCoordinator: Coordinator {
    
    private let presenter: Router
    private var viewController: DriversViewController?
    private var detailCoordinator: DriverDetailCoordinator?
    
    init(presenter: Router) {
        self.presenter = presenter
    }

    func start() {
        let viewController = DriversViewController()
        viewController.delegate = self
        self.presenter.setViewControllers(viewcontrollers: [viewController], animated: false)
        self.viewController = viewController
    }
}

extension MainCoordinator: DriversViewControllerDelegate {
    func driverDidSelect(driver: DriversListViewModel) {
        let coordinator = DriverDetailCoordinator(presenter: presenter, driver: driver)
        coordinator.start()
        self.detailCoordinator = coordinator
    }

}
