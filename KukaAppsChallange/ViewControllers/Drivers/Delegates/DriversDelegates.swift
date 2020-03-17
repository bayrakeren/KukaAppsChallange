//
//  DriversDelegates.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

extension DriversViewController: BaseViewModelDelegate {
    func onLoadEnd() {
        self.dataSource?.updateItems(viewModel.drivers)
        self.tableView.reloadWith(viewModel.tableViewState)
    }
    
    func onLoadError(_ error: String?) {
        self.tableView.showError(error)
    }
}

extension DriversViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let driver = viewModel.driver(indexPath) else { return }
        self.delegate?.driverDidSelect(driver: driver)
    }
}

extension DriversViewController: BaseTableViewCellTappedDelegate {
    func didTap(cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        guard let driver = viewModel.driver(indexPath) else { return }
        
        if driver.isFavorited {
            FavoriteManager.shared.popFavorite(driver: driver)
        } else {
            FavoriteManager.shared.pushFavorite(driver: driver)
        }
        
        self.tableView.reloadRows(at: [indexPath], with: .fade)
    }
}
