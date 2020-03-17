//
//  DriverDetailCoordinator.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

class DriverDetailCoordinator: Coordinator {
    private var presenter: Router
    private var driver: DriversListViewModel
    private var viewController: DriverDetailViewController?
    
    init(presenter: Router, driver: DriversListViewModel) {
        self.presenter = presenter
        self.driver = driver
    }
    
    func start() {
        let viewController = DriverDetailViewController()
        viewController.driverId = driver.id
        viewController.title = driver.name
        self.presenter.push(viewController, animated: true, completion: nil)
        self.viewController = viewController
    }
}
