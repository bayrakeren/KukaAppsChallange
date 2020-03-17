//
//  BaseViewModelDelegate.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
    func onLoadEnd()
    func onLoadStart()
    func onChange()
    func onLoadError(_ error: String?)
    func endPaging(_ on: Int)
}

extension BaseViewModelDelegate {
    func onLoadStart() { }
    func onChange() { }
    func endPaging(_ on: Int) { }
}
