//
//  BaseViewController.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController, NVActivityIndicatorViewable {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.isTranslucent = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.title = nil
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.view.backgroundColor = self.navigationController?.navigationBar.barTintColor
        self.navigationController?.navigationBar.topItem?.title = " "
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.hideHUD()
    }
    
    func showHUD() {
        self.startAnimating(type: .ballRotateChase, color: .blue)
    }
    
    func hideHUD() {
        self.stopAnimating()
    }

    func setNavigationControllerLargeTitle(title:String,color:UIColor) {
        self.title = title
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: color]
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
    }
}

