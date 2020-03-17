//
//  DriverDetailDelegates.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

extension DriverDetailViewController: BaseViewModelDelegate {
    func onLoadEnd() {
        self.indicatorView.removeFromSuperview()
        
        let driver = viewModel.driver
        
        self.driverImageView.setImage(withPath: driver?.imagePath)
        self.driverTeamNameLabel.text = driver?.team
        self.driverAgeLabel.text = driver?.age
    }
    
    func onLoadError(_ error: String?) {
        print(error ?? "")
    }
}
