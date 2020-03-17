//
//  DriversService.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

class DriversService {
    
    static func drivers(completion: @escaping (_ result: APIResult<DriversListResponseModel>) -> Void ) {
        Managers.shared.serviceManager.fetch(target: DriversAPI.drivers, completion: completion)
    }
    
    static func driverDetail(id: Int, completion: @escaping (_ result: APIResult<DriverDetailResponseModel>) -> Void ) {
        Managers.shared.serviceManager.fetch(target: DriversAPI.driverDetail(id: id.description), completion: completion)
    }
}
