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
    
    func move(from point: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = CGAffineTransform(translationX: point.x, y: point.y)
        animate(block: { [weak self] in
            self?.transform = .identity
            }, with: animatorProvider, delay: delay)
    }

    func move(to point: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        animate(block: { [weak self] in
            self?.transform = CGAffineTransform(translationX: point.x, y: point.y)
            }, with: animatorProvider, delay: delay)
    }
    
    func scale(from scale: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = CGAffineTransform(scaleX: scale.x, y: scale.y)
        animate(block: { [weak self] in
            self?.transform = .identity
            }, with: animatorProvider, delay: delay)
    }
    
    func scale(to scale: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        animate(block: { [weak self] in
            self?.transform = CGAffineTransform(scaleX: scale.x, y: scale.y)
            }, with: animatorProvider, delay: delay)
    }
    
    func alpha(form alpha: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        let originalAlpha = self.alpha
        self.alpha = alpha
        animate(block: { [weak self] in
            self?.alpha = originalAlpha
            }, with: animatorProvider, delay: delay)
    }
    
    func alpha(to alpha: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        animate(block: { [weak self] in
            self?.alpha = alpha
            }, with: animatorProvider, delay: delay)
    }
    
    private func animate(block: @escaping () -> Void, with animatorProvider: AnimatorProvider, delay: TimeInterval) {
        let animator = animatorProvider.animator()
        animator.addAnimations {
            block()
        }
        animator.startAnimation(afterDelay: delay)
    }
    
//    func shakeAnimation() {
//        layer.removeAnimation(forKey: ViewAnimation.shake.rawValue)
//        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x")
//        translation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//        translation.values = [-3, 3, -3, 3, -2, 2, -1, 1, 0]
////        translation.duration = animator.duration
//        layer.add(translation, forKey: ViewAnimation.shake.rawValue)
//    }
//
//    func animate(with animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), animation: @escaping (UIView) -> Void,
//                 completion: (() -> Void)?) {
//        layer.removeAnimation(forKey: ViewAnimation.shake.rawValue)
//        let animator = animatorProvider.animator()
//        animator.addAnimations { [weak self] in
//            guard let strongSelf = self else { return }
//            animation(strongSelf)
//        }
//        animator.addCompletion { (_) in
//            completion?()
//        }
//        animator.startAnimation()
//    }
    
}
