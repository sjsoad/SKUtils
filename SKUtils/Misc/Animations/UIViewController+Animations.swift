//
//  UIViewController+Animations.swift
//  SKUtils
//
//  Created by Sergey on 06.07.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKAnimator

extension UIViewController {
    
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
