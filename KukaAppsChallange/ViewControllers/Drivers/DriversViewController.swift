//
//  DriversViewController.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

protocol DriversViewControllerDelegate: AnyObject {
    func driverDidSelect(driver: DriversListViewModel)
}

class DriversViewController: BaseViewController {

    @IBOutlet weak var tableView: EnumDrivenTableView!
    
    var dataSource: TableViewDataSource<DriversListCell, DriversListViewModel>?
    var viewModel: DriversViewModel = DriversViewModel()
    
    weak var delegate: DriversViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = TableViewDataSource(delegate: self, canLoadNext: nil)
        self.viewModel.delegate = self
        self.viewModel.getDrivers()
        
        self.tableView.registerNib(witClassAndIdentifier: DriversListCell.self)
        self.tableView.dataSource = dataSource
    }
}
