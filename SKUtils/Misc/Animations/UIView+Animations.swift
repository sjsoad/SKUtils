//
//  UIView+Animations.swift
//  SKUtils
//
//  Created by Sergey on 23.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKAnimator

public extension UIView {
    
    @discardableResult
    func animate(animationBlock: @escaping () -> Void, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(),
                 delay: TimeInterval = 0.0, completion: (() -> Void)? = nil) -> UIViewPropertyAnimator {
        let animator = animatorProvider.animator()
        animator.addAnimations(animationBlock)
        animator.addCompletion { (_) in
            completion?()
        }
        animator.startAnimation(afterDelay: delay)
        return animator
    }
    
}

public extension UIView {
    
    // MARK: - Movement -
    
//    func move(from point: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
//        let originalTransform = transform
//        transform = transform.translatedBy(x: point.x, y: point.y)
//        animate(block: { [weak self] in
//            self?.transform = originalTransform
//            }, with: animatorProvider, delay: delay)
//    }

    func move(to point: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
//        animate(block: { [weak self] in
//            guard let strongSelf = self else { return }
            transform = transform.translatedBy(x: point.x, y: point.y)
//            }, with: animatorProvider, delay: delay)
    }
    
    // MARK: - Scaling -
    
//    func scale(from scale: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
//        let originalTransform = transform
//        transform = transform.scaledBy(x: scale.x, y: scale.y)
//        animate(block: { [weak self] in
//            self?.transform = originalTransform
//            }, with: animatorProvider, delay: delay)
//    }
//
//    func scale(to scale: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
//        animate(block: { [weak self] in
//            guard let strongSelf = self else { return }
//            strongSelf.transform = strongSelf.transform.scaledBy(x: scale.x, y: scale.y)
//            }, with: animatorProvider, delay: delay)
//    }
    
    // MARK: - Alpha -
    
//    func alpha(form alpha: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
//        let originalAlpha = self.alpha
//        self.alpha = alpha
//        animate(block: { [weak self] in
//            self?.alpha = originalAlpha
//            }, with: animatorProvider, delay: delay)
//    }
    
    func alpha(to alpha: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
//        animate(block: { [weak self] in
            self.alpha = alpha
//            }, with: animatorProvider, delay: delay)
    }
    
    // MARK: - Private -
    
//    private func animate(block: @escaping () -> Void, with animatorProvider: AnimatorProvider, delay: TimeInterval) {
//        let animator = animatorProvider.animator()
//        animator.addAnimations {
//            block()
//        }
//        animator.startAnimation(afterDelay: delay)
//    }
    
}
