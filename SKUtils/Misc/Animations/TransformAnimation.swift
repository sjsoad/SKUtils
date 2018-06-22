//
//  TransformAnimation.swift
//  SKUtils
//
//  Created by Sergey on 19.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

open class TransformAnimation: ViewAnimation {
    
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
    
    class func flipFromLeft() -> ViewAnimation {
        return TransformAnimation(fromTransfrom: CGAffineTransform(scaleX: -1, y: 1))
    }

    class func flipFromBottom() -> ViewAnimation {
        return TransformAnimation(fromTransfrom: CGAffineTransform(scaleX: 1, y: -1))
    }

    class func moveFromVertical(position: CGFloat) -> ViewAnimation {
        return TransformAnimation(fromTransfrom: CGAffineTransform(translationX: 0, y: position))
    }

    class func moveFromHorizontal(position: CGFloat) -> ViewAnimation {
        return TransformAnimation(fromTransfrom: CGAffineTransform(translationX: position, y: 0))
    }
    
}
