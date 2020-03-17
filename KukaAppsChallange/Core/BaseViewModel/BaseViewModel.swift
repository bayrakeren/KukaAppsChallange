//
//  BaseViewModel.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

class BaseViewModel {
    
    weak var delegate: BaseViewModelDelegate?

    var isLoading : Bool = false
    var hasData : Bool = false

    func didChange() {
        self.isLoading = false
        self.delegate?.onChange()
    }

    func startLoading() {
        self.isLoading = true
        self.delegate?.onLoadStart()
    }

    func endLoading() {
        self.isLoading = false
        self.delegate?.onLoadEnd()
    }
    
    func hasError(error: String?) {
        self.isLoading = false
        self.delegate?.onLoadError(error)
    }
    
    func endPaging(_ on: Int) {
        self.isLoading = false
        self.delegate?.endPaging(on)
    }
}
