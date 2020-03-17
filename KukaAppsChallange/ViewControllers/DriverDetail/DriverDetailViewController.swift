//
//  DriverDetailViewController.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

class DriverDetailViewController: BaseNavigationViewController {

    @IBOutlet weak var driverImageView: UIImageView!
    @IBOutlet weak var driverTeamNameLabel: UILabel!
    @IBOutlet weak var driverAgeLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    
    var driverId: Int?
    var viewModel: DriverDetailViewModel = DriverDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        
        guard let id = driverId else {
            self.navigationController?.popViewController(animated: false)
            return
        }
        
        self.viewModel.getDriverDetail(id: id)
    }
}
