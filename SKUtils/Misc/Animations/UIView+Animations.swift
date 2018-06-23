//
//  UIView+Animations.swift
//  SKUtils
//
//  Created by Sergey on 23.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

extension UIView {

    func animate(with animationProviders: [ViewAnimationProvider], animatorProvider: AnimatorProvider = DefaultAnimatorProvider(),
                 reverse: Bool = true) {
        let prepareAnimator = animatorProvider.animator()
        prepareAnimator.addAnimations {
            animationProviders.forEach({ (animationProvider) in
                animationProvider.prepare(self)
            })
        }
        let mainAnimator = animatorProvider.animator()
        mainAnimator.addAnimations {
            animationProviders.forEach({ (animationProvider) in
                animationProvider.perform(for: self)
            })
        }
        let reverseAnimator = animatorProvider.animator()
        reverseAnimator.addAnimations {
            animationProviders.forEach({ (animationProvider) in
                animationProvider.prepare(self)
            })
        }
        prepareAnimator.addCompletion { (_) in
            mainAnimator.startAnimation()
        }
        mainAnimator.addCompletion { (_) in
            guard reverse else { return }
            reverseAnimator.startAnimation()
        }
        prepareAnimator.startAnimation()
    }
    
}
