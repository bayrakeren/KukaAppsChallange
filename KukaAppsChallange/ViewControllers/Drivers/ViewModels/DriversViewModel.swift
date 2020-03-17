//
//  DriversViewModel.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

struct DriversListViewModel: Codable, Equatable {
    let id: Int
    let name: String
    let point: Int
    
    var isFavorited: Bool {
        return FavoriteManager.shared.isFavoritesContains(id)
    }
    
    static func ==(lhs: DriversListViewModel, rhs: DriversListViewModel) -> Bool {
        return lhs.id == rhs.id
    }
}

class DriversViewModel: BaseViewModel {
    
    var drivers: [DriversListViewModel]?
    
    func getDrivers() {
        self.startLoading()
        DriversService.drivers { [weak self] (result) in
            switch result {
            case .success(let response):
                let drivers = response.items?.map( {
                    DriversListViewModel(id: $0.id ?? 0,
                                         name: $0.name ?? "Bilinmiyor",
                                         point: $0.point ?? 0)
                })
                
                self?.drivers = drivers?.sorted(by: {$0.point > $1.point})
                self?.endLoading()
            case .failure(let error):
                self?.hasError(error: error.errorDescription)
            }
        }
    }
    
    var tableViewState: TableViewState {
        if drivers?.count ?? 0 > 0 {
            return .hasData(sections: 1, animated: true)
        } else {
            return .empty(message: "Listenelecek Kayıt Bulunamadı", view: nil)
        }
    }
    
    func driver(_ at: IndexPath) -> DriversListViewModel? {
        return drivers?[at.row]
    }
}
