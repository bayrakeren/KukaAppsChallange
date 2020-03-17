//
//  TableViewExtensions.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNib<T>(witClassAndIdentifier:T.Type) {
        self.register(UINib.init(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }
    
    func registerHeaderFooterView<T>(witClassAndIdentifier:T.Type) {
        self.register(UINib.init(nibName: String(describing: T.self), bundle: nil), forHeaderFooterViewReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueCell<T>(withClassAndIdentifier classAndIdentifier: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
