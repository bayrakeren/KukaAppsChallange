//
//  EnumDrivenTableView.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

enum TableViewState {
    case loading
    case hasData(sections: Int, animated: Bool)
    case empty(message: String?, view: UIView?)
    case paging(section: Int, animated: Bool)
    case error(String?)
}

class EnumDrivenTableView: UITableView {
    
    var refreshController = UIRefreshControl()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.showSpinner(true)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.showSpinner(true)
    }
    
    func reloadWith(_ state: TableViewState) {
        self.resetStates()
        self.endRefreshing()
        
        switch state {
        case .loading:
            self.showSpinner(true)
        case .hasData(let section, let animated):
            if animated {
                self.reloadSections(IndexSet(0..<section), with: .automatic)
                return
            } else {
                break
            }
        case .empty(let message, let view):
            self.showEmptyMessage(message, emptyView: view)
        case .error(let error):
            self.showError(error)
        case .paging(let section, let animated):
            if animated {
                self.reloadSections(IndexSet(0..<section), with: .automatic)
                return
            } else {
                break
            }
        }
        
        self.reloadData()
    }
    
    func showSpinner(_ isAnimating: Bool) {
        let loadingView = LoadingFooterView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 50))
        self.tableFooterView = loadingView
        self.tableFooterView?.isHidden = !isAnimating
    }
    
    func showError(_ error: String?) {
        if error != nil {
            let errorView = ErrorMessageView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 100))
            errorView.setError(error)
            self.tableFooterView = errorView
            self.tableFooterView?.isHidden = false
        } else {
            self.tableFooterView = nil
            self.tableFooterView?.isHidden = true
        }
    }
    
    func showEmptyMessage(_ message: String?, emptyView: UIView? = nil) {
        if message != nil {
            if emptyView != nil {
                self.tableFooterView = emptyView
            } else {
                let errorView = ErrorMessageView(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: 100))
                errorView.setError(message)
                self.tableFooterView = errorView
            }
            self.tableFooterView?.isHidden = false
        } else {
            self.tableFooterView = nil
            self.tableFooterView?.isHidden = true
        }
    }
    
    func setupRefreshController(target: Any?, action: Selector) {
        self.refreshController.addTarget(target, action: action, for: .valueChanged)
        self.refreshControl = refreshController
    }
    
    func endRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.refreshControl?.endRefreshing()
        }
    }

    func resetStates() {
        self.showError(nil)
        self.showSpinner(false)
        self.showEmptyMessage(nil)
    }
}
