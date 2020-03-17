//
//  Managers.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

enum ServiceURLConstansType {
    case live
    case test
}

class Managers: NSObject {

    static let shared = Managers()
    
    var serviceManager = ServiceManager.init(constants: LiveServiceConstants())
    
    var serviceURLConstansType : ServiceURLConstansType = .live {
        didSet {
            switch serviceURLConstansType {
            case .live:
                Managers.shared.serviceManager = ServiceManager.init(constants: LiveServiceConstants())
            case .test:
                Managers.shared.serviceManager = ServiceManager.init(constants: TestServiceConstants())
            }
            
        }
    }
}
