//
//  ImageViewExtensions.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(withPath path: String?) {
        guard let realPath = path else {
            return
        }
        guard let url = URL(string: realPath) else { return }
        let resource = ImageResource(downloadURL: url, cacheKey: realPath)
        self.kf.indicatorType = .activity
        (kf.indicator?.view as? UIActivityIndicatorView)?.color = .gray
        self.kf.setImage(with: resource,
                         options: [.transition(ImageTransition.fade(0.3)), .forceTransition])
    }
}
