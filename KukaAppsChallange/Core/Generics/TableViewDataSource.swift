//
//  TableViewDataSource.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: BaseTableViewCell {
        
    var delegate: BaseTableViewCellTappedDelegate?
    var numberOfSection: Int = 1
    var items: [ViewModel]? = []
    var shouldLoadNext: Bool = false
    var canLoadNext: (() -> Void)?
    
    init(delegate: BaseTableViewCellTappedDelegate? = nil, canLoadNext: (() -> Void)? = nil) {
        self.delegate = delegate
        self.canLoadNext = canLoadNext
        self.shouldLoadNext = canLoadNext != nil
    }
        
    func updateItems(_ items: [ViewModel]?) {
        self.items = items
    }
    
    func removeItems() {
        self.items = []
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if shouldLoadNext {
            if  indexPath.item > (items?.count ?? 20) - 2 {
                self.canLoadNext?()
                let spinner = UIActivityIndicatorView(style: .gray)
                spinner.startAnimating()
                spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
                
                tableView.tableFooterView = spinner
                tableView.tableFooterView?.isHidden = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    tableView.tableFooterView = nil
                }
            }
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(CellType.self)", for: indexPath) as? CellType else {
            fatalError("Cell with identifier \(CellType.self) not found")
        }
        
        let vm = self.items?[indexPath.row]
        cell.configure(cellData: vm)
        if delegate != nil {
            cell.cellDelegate = delegate
        }
        return cell
    }
}
