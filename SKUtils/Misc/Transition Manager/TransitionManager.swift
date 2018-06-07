//
//  TransitionManager.swift
//  SKUtils
//
//  Created by Sergey on 06.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol TransitionManaging: UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var transitionDuration: TimeInterval { get }
    var reverseTransition: Bool { get }
    var transitionAnimationProvider: TransitionAnimationProvider { get }
    
    func set(reverseTransition: Bool)
    
}

class TransitionManager: NSObject, TransitionManaging {

    private(set) var transitionDuration: TimeInterval
    private(set) var transitionAnimationProvider: TransitionAnimationProvider
    private(set) var reverseTransition: Bool = false
    
    init(transitionDuration: TimeInterval = 1, transitionAnimationProvider: TransitionAnimationProvider) {
        self.transitionDuration = transitionDuration
        self.transitionAnimationProvider = transitionAnimationProvider
    }
    
    // MARK: - Private -
    
    private func animationFinished() {
        reverseTransition = !reverseTransition
    }
    
    // MARK: - TransitionManaging -
    
    func set(reverseTransition: Bool) {
        self.reverseTransition = reverseTransition
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning -
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        transitionAnimationProvider.animateTransition(using: transitionContext, reverseTransition: reverseTransition,
                                                      duration: transitionDuration(using: transitionContext), completion: { [weak self] (_) in
            self?.animationFinished()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
    // MARK: - UIViewControllerTransitioningDelegate -
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return InteractionManager(presentedViewController: presented, presenting: source)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
}
