//
//  UIView+Animations.swift
//  SKUtils
//
//  Created by Sergey on 23.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

public enum ViewAnimation: String {
    case shake
}

public extension UIView {
    
    func shakeAnimation() {
        layer.removeAnimation(forKey: ViewAnimation.shake.rawValue)
        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        translation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        translation.values = [-3, 3, -3, 3, -2, 2, -1, 1, 0]
//        translation.duration = animator.duration
        layer.add(translation, forKey: ViewAnimation.shake.rawValue)
    }
    
    func animate(with animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), animation: @escaping (UIView) -> Void,
                 completion: (() -> Void)?) {
        layer.removeAnimation(forKey: ViewAnimation.shake.rawValue)
        let animator = animatorProvider.animator()
        animator.addAnimations { [weak self] in
            guard let strongSelf = self else { return }
            animation(strongSelf)
        }
        animator.addCompletion { (_) in
            completion?()
        }
        animator.startAnimation()
    }
    
}
