//
//  KukaAppsChallangeRouter.swift
//  KukaAppsChallange
//
//  Created by Eren Bayrak on 17.03.2020.
//  Copyright © 2020 Eren Bayrak. All rights reserved.
//

import UIKit

class KukaAppsChallangeRouter: NSObject, Router {
    
    private var completions: [UIViewController: () -> Void]
    
    public var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }
    
    public unowned let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.completions = [:]
        super.init()
        self.navigationController.delegate = self
    }
    
    public func toShowable() -> UIViewController {
        return navigationController
    }
    
    func present(_ module: Showable, animated: Bool) {
        self.navigationController.present(module.toShowable(), animated: animated, completion: nil)
    }
    
    func push(_ module: Showable, animated: Bool, completion: (() -> Void)?) {
        let controller = module.toShowable()
        
        guard controller is UINavigationController == false else { return }
        
        if let completion = completion {
            self.completions[controller] = completion
        }
        
        self.navigationController.pushViewController(controller, animated: animated)
    }
    
    func pop(animated: Bool) {
        if let controller = navigationController.popViewController(animated: animated) {
            self.runCompletion(for: controller)
        }
    }
    
    public func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        
        completion()
        self.completions.removeValue(forKey: controller)
    }
    
    func setViewControllers(viewcontrollers: [UIViewController], animated: Bool) {
        self.completions.removeAll()
        self.navigationController.setViewControllers(viewcontrollers, animated: animated)
    }
}

extension KukaAppsChallangeRouter: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(poppedViewController) else { return }
        
        self.runCompletion(for: poppedViewController)
    }
}
