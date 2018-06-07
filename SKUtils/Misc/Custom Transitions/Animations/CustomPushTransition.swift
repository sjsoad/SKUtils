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
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        reverseTransition == false ? container.addSubview(toView) : container.insertSubview(toView, belowSubview: fromView)
        let detailView = reverseTransition == false ? toView : fromView
        toView.frame = reverseTransition == false ?  CGRect(x: fromView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height) :
            toView.frame
        toView.alpha = reverseTransition == false ? 0 : 1
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { [reverseTransition] in
            detailView.frame = reverseTransition == false ? fromView.frame :
                CGRect(x: toView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height)
            detailView.alpha = reverseTransition == false ? 1 : 0
            }, completion: { [weak self] (_) in
                self?.animationFinished()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}
