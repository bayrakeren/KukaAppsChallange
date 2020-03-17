//
//  DriversListCell.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

class DriversListCell: BaseTableViewCell {

    @IBOutlet weak var driverNameLabel: UILabel!
    @IBOutlet weak var driverPointLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func configure(cellData: Any?) {
        if let data = cellData as? DriversListViewModel {
            self.driverNameLabel.text = data.name
            self.driverPointLabel.text = data.point.description
            self.favoriteButton.setImage(data.isFavorited ? UIImage.favoriteFill: UIImage.favorite, for: .normal)
        }
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        self.cellDelegate?.didTap(cell: self)
    }
}
