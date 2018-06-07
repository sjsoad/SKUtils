//
//  AnimationsFactory.swift
//  SKUtils
//
//  Created by Sergey on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol TransitionAnimationProvider {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning, reverseTransition: Bool, duration: TimeInterval,
                           completion: @escaping ((Bool) -> Void))
    
}

class PushTransitionAnimation: TransitionAnimationProvider {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning, reverseTransition: Bool, duration: TimeInterval,
                           completion: @escaping ((Bool) -> Void)) {
        let container = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        reverseTransition == false ? container.addSubview(toView) : container.insertSubview(toView, belowSubview: fromView)
        let detailView = reverseTransition == false ? toView : fromView
        toView.frame = reverseTransition == false ?  CGRect(x: fromView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height) :
            toView.frame
        toView.alpha = reverseTransition == false ? 0 : 1
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: { [reverseTransition] in
            detailView.frame = reverseTransition == false ? fromView.frame :
                CGRect(x: toView.frame.width, y: 0, width: toView.frame.width, height: toView.frame.height)
            detailView.alpha = reverseTransition == false ? 1 : 0
            }, completion: completion)
    }
    
}

class FallTransitionAnimation: TransitionAnimationProvider {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning, reverseTransition: Bool, duration: TimeInterval,
                           completion: @escaping ((Bool) -> Void)) {
        let container = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        reverseTransition == false ? container.addSubview(toView) : container.insertSubview(toView, belowSubview: fromView)
        let detailView = reverseTransition == false ? toView : fromView
        toView.frame = reverseTransition == false ?  CGRect(x: 0, y: -toView.frame.height, width: toView.frame.width, height: toView.frame.height) :
            toView.frame
        toView.alpha = reverseTransition == false ? 0 : 1
        toView.layoutIfNeeded()
        
        UIView.animate(withDuration: duration, animations: { [reverseTransition] in
            detailView.frame = reverseTransition == false ? fromView.frame :
                CGRect(x: 0, y: -toView.frame.height, width: toView.frame.width, height: toView.frame.height)
            detailView.alpha = reverseTransition == false ? 1 : 0
            }, completion: completion)
    }
    
}
