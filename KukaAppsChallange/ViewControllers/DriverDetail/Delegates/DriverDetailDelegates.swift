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
        
        guard let driver = viewModel.driver else {
            self.navigationController?.popViewController(animated: false)
            return
        }
        
        self.driverImageView.setImage(withPath: driver.imagePath)
        self.driverTeamNameLabel.text = "Team: " + driver.team
        self.driverAgeLabel.text = "Age: " + driver.age
        self.animation()
    }
    
    func onLoadError(_ error: String?) {
        print(error ?? "")
    }
}
