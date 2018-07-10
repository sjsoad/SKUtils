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
    
    // MARK: - Identity -
    
    func cancelAllTransformations(animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = .identity
    }
    
    // MARK: - Movement -
    
    func move(by point: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = transform.translatedBy(x: point.x, y: point.y)
    }
    
    func moveX(by xPosition: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = transform.translatedBy(x: xPosition, y: 0)
    }
    
    func moveY(by yPosition: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = transform.translatedBy(x: 0, y: yPosition)
    }
    
    func set(position: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = CGAffineTransform(translationX: position.x, y: position.y)
    }

    func set(xPosition: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = CGAffineTransform(translationX: xPosition, y: transform.ty)
    }
    
    func set(yPosition: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = CGAffineTransform(translationX: transform.tx, y: yPosition)
    }
    
    // MARK: - Scaling -
    
    func scale(by scale: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = transform.scaledBy(x: scale.x, y: scale.y)
    }
    
    func scaleX(by xScale: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = transform.scaledBy(x: xScale, y: yScale)
    }
    
    func scaleY(by yScale: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = transform.scaledBy(x: xScale, y: yScale)
    }
    
    func set(scale: CGPoint, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = CGAffineTransform(scaleX: scale.x, y: scale.y)
    }

    func set(xScale: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = CGAffineTransform(scaleX: xScale, y: yScale)
    }
    
    func set(yScale: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = CGAffineTransform(scaleX: xScale, y: yScale)
    }
    
    // MARK: - Alpha -
    
    func alpha(to alpha: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        self.alpha = alpha
    }
    
    // MARK: - Rotation -
    
    func rotate(to angle: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = CGAffineTransform(rotationAngle: radians(from: angle))
    }
    
    func rotate(by angle: CGFloat, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.0) {
        transform = transform.rotated(by: radians(from: angle))
    }
    
    // MARK: - Private -
    
    private func radians(from angle: CGFloat) -> CGFloat {
        return angle * (180 / CGFloat.pi)
    }
    
    private var xScale: CGFloat {
        return sqrt(pow(transform.a, 2) + pow(transform.c, 2))
    }

    private var yScale: CGFloat {
        return sqrt(pow(transform.b, 2) + pow(transform.d, 2))
    }
    
}
