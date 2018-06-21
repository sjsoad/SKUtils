//
//  AnimatorProvider.swift
//  SKUtils
//
//  Created by Sergey on 19.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

public protocol AnimatorProvider {

    func animator() -> UIViewPropertyAnimator
    
}

open class DefaultAnimatorProvider: AnimatorProvider {
    
    public func animator() -> UIViewPropertyAnimator {
        let animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut, animations: nil)
        return animator
    }
    
}

open class SpringAnimatorProvider: AnimatorProvider {
    
    public func animator() -> UIViewPropertyAnimator {
        let animator = UIViewPropertyAnimator(duration: 0.25, dampingRatio: 0.7, animations: nil)
        return animator
    }
    
}

open class ControlPointAnimatorProvider: AnimatorProvider {
    
    public func animator() -> UIViewPropertyAnimator {
        let animator = UIViewPropertyAnimator(duration: 0.25, controlPoint1: CGPoint(x: 0.2, y: 0.9), controlPoint2: CGPoint(x: 0.8, y: 0.1),
                                              animations: nil)
        return animator
    }
    
}
