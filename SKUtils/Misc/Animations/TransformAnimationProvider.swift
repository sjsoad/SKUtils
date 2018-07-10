//
//  TransformAnimationProvider.swift
//  SKUtils
//
//  Created by Sergey on 19.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

open class TransformAnimationProvider: ViewAnimationProvider {
    
    private var fromTransfrom: CGAffineTransform
    private var toTransform: CGAffineTransform
    
    public init(fromTransfrom: CGAffineTransform = .identity, toTransform: CGAffineTransform = .identity) {
        self.fromTransfrom = fromTransfrom
        self.toTransform = toTransform
    }
    
    // MARK: - ViewAnimation -
    
    public func prepare(_ view: UIView) {
        view.transform = fromTransfrom
    }
    
    public func perform(for view: UIView) {
        view.transform = toTransform
    }
    
    // MARK: - Animations -
    
    class func flipFromLeft() -> ViewAnimationProvider {
        return TransformAnimationProvider(fromTransfrom: CGAffineTransform(scaleX: -1, y: 1))
    }

    class func flipFromBottom() -> ViewAnimationProvider {
        return TransformAnimationProvider(fromTransfrom: CGAffineTransform(scaleX: 1, y: -1))
    }

    class func moveFromVertical(position: CGFloat) -> ViewAnimationProvider {
        return TransformAnimationProvider(fromTransfrom: CGAffineTransform(translationX: 0, y: position))
    }

    class func moveFromHorizontal(position: CGFloat) -> ViewAnimationProvider {
        return TransformAnimationProvider(fromTransfrom: CGAffineTransform(translationX: position, y: 0))
    }
    
    class func scale(scaleX: CGFloat = 1.05, scaleY: CGFloat = 1.05) -> ViewAnimationProvider {
        return TransformAnimationProvider(toTransform: CGAffineTransform(scaleX: scaleX, y: scaleY))
    }
    
}
