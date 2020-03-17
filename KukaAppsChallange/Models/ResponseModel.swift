//
//  ResponseModel.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

struct DriversListResponseModel: Decodable {
    let items: [Driver]?
}

struct Driver: Decodable {
    let id: Int?
    let name: String?
    let point: Int?
}

struct DriverDetailResponseModel: Decodable {
    let id: Int?
    let age: Int?
    let image: String?
    let team: String?
}
