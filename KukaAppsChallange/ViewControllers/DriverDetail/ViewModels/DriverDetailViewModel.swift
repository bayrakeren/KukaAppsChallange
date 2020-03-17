//
//  DriverDetailViewModel.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

struct DriverDetailModel {
    let imagePath: String
    let age: String
    let team: String
}

class DriverDetailViewModel: BaseViewModel {

    var driver: DriverDetailModel?
    
    func getDriverDetail(id: Int) {
        self.startLoading()
        DriversService.driverDetail(id: id) { [weak self] (result) in
            switch result {
            case .success(let response):
                self?.driver = DriverDetailModel(imagePath: response.image ?? "",
                                                 age: response.age?.description ?? "Bilinmiyor",
                                                 team: response.team ?? "Bilinmiyor")
                self?.endLoading()
            case .failure(let error):
                self?.hasError(error: error.errorDescription)
            }
        }
    }
}
