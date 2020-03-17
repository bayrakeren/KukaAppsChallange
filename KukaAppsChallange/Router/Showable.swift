//
//  Showable.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

protocol Showable {
    func toShowable() -> UIViewController
}

extension UIViewController: Showable {
    public func toShowable() -> UIViewController {
        return self
    }
}
