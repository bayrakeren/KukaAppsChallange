//
//  BaseTableViewCell.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

protocol BaseTableViewCellTappedDelegate: class {
    func didTap(cell: UITableViewCell)
}

class BaseTableViewCell: UITableViewCell {

    weak var cellDelegate: BaseTableViewCellTappedDelegate?
    
    func configure(cellData: Any?) {

    }
}
