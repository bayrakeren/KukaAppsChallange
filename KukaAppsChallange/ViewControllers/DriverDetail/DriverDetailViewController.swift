//
//  DriverDetailViewController.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

class DriverDetailViewController: BaseNavigationViewController {

    @IBOutlet weak var driverImageView: UIImageView!
    @IBOutlet weak var driverTeamNameLabel: UILabel!
    @IBOutlet weak var driverAgeLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    
    var driverId: Int?
    var viewModel: DriverDetailViewModel = DriverDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        
        guard let id = driverId else {
            self.navigationController?.popViewController(animated: false)
            return
        }
        
        self.viewModel.getDriverDetail(id: id)
    }
    
    func animation() {
        let animation = CASpringAnimation(keyPath: "position.x")
        animation.damping = 10
        animation.mass = 2
        animation.stiffness = 20
        animation.initialVelocity = 1.0
        animation.duration = animation.settlingDuration
        animation.fromValue = -view.bounds.size.width/2
        animation.toValue = view.bounds.size.width/2 - 16
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        driverTeamNameLabel.layer.add(animation, forKey: nil)
        
        animation.beginTime = CACurrentMediaTime() + 0.3
        driverAgeLabel.layer.add(animation, forKey: nil)
    }
}
