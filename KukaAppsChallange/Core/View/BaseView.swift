//
//  BaseView.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

class BaseView: UIView {

    @IBOutlet weak var baseContentView:UIView?
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerrRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerrRadius
        }
    }
    
    @IBInspectable var isTransparent: Bool = false {
        didSet {
            if isTransparent {
                self.setTransparent()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    func setTransparent() {
        self.backgroundColor = .clear
        self.baseContentView?.backgroundColor = .clear
    }
    
    func initWithNibName(name: String) {
        Bundle.main.loadNibNamed(name, owner: self, options: nil)
        guard let content = baseContentView else { return }
        content.frame = self.bounds
        content.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(content)
    }
}
