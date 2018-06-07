//
//  NavigationController.swift
//  SKUtils
//
//  Created by Sergey on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol ViewControllerAnimatedTransitioningProvider {

    var animationController: TransitionManaging? { get set }
    
}

protocol InteractiveNavigation {
    
    var isInteractive: Bool { get }
    func set(interactive: Bool)
    
}

class NavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate, InteractiveNavigation {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // Do any additional setup after loading the view.
    }

    // MARK: - InteractiveNavigation -
    
    var isInteractive: Bool {
        return interactivePopGestureRecognizer?.isEnabled ?? false
    }
    
    func set(interactive: Bool) {
        interactivePopGestureRecognizer?.isEnabled = interactive
        interactivePopGestureRecognizer?.delegate = interactive ? self : nil
    }
    
    // MARK: - UINavigationControllerDelegate -
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let sourceVC = operation == .push ? fromVC : toVC
        guard let animatedTransitioningProvider = sourceVC as? ViewControllerAnimatedTransitioningProvider else { return nil }
        animatedTransitioningProvider.animationController?.set(reverseTransition: operation == .pop)
        return animatedTransitioningProvider.animationController
    }
    
    // MARK: - UIGestureRecognizerDelegate -
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
