//
//  CustomPushTransition.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

class CustomPushTransition: NSObject, CustomAnimatedTransitioning {

    var duration: TimeInterval
    var reverseTransition: Bool
    
    required init(duration: TimeInterval = 1, reverseTransition: Bool = false) {
        self.duration = duration
        self.reverseTransition = reverseTransition
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning -
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        reverseTransition == false ? container.addSubview(toView) : container.insertSubview(toView, belowSubview: fromView)
        
        var leftTranslation = CGAffineTransform(translationX: -container.frame.width, y: 0)
        var rightTranslation = CGAffineTransform(translationX: container.frame.width, y: 0)
        leftTranslation = leftTranslation.scaledBy(x: 0.8, y: 0.8)
        rightTranslation = rightTranslation.scaledBy(x: 0.8, y: 0.8)
        
        toView.transform = reverseTransition == false ? rightTranslation : leftTranslation
        fromVC.navigationController?.setNavigationBarHidden(true, animated: true)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { [reverseTransition] in
            toView.transform = .identity
            fromView.transform = reverseTransition == false ? leftTranslation : rightTranslation
            toVC.navigationController?.setNavigationBarHidden(false, animated: false)
            }, completion: { [weak self] (_) in
                self?.animationFinished()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                toView.transform = .identity
                fromView.transform = .identity
        })
    }
    
}
