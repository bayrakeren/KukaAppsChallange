//
//  ServiceConstants.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

protocol ServiceConstantsProtocol {
    var apiURL: String { get }
}

/*
 There can be a TestServiceConstants for a development build in the future.
*/
class LiveServiceConstants: NSObject, ServiceConstantsProtocol {
    let apiURL: String = "https://my-json-server.typicode.com/oguzayan/kuka/"

}

class TestServiceConstants: NSObject, ServiceConstantsProtocol {
    let apiURL: String = "..."
}
