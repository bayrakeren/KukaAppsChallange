//
//  ErrorMessageView.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

class ErrorMessageView: BaseView {
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    func configure() {
        super.initWithNibName(name: "ErrorMessageView")
        self.errorLabel.text = "No record to list."
    }
    
    func setError(_ error: String?) {
        self.errorLabel.text = error
    }
}
