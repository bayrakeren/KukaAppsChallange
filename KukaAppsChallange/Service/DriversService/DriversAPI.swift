//
//  DriversAPI.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Moya

enum DriversAPI {
    case drivers
    case driverDetail(id: String)
}

extension DriversAPI: TargetType {
    
    var path: String {
        switch self {
        case .drivers:
            return EndPoints.drivers
        case .driverDetail(let id):
            return EndPoints.driverDetail + id
        }
    }
    
    var method: Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
}

