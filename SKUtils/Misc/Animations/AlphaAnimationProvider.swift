//
//  AlphaAnimationProvider.swift
//  SKUtils
//
//  Created by Sergey on 19.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

open class AlphaAnimationProvider: ViewAnimationProvider {
    
    private var fromAlpha: CGFloat
    private var toAlpha: CGFloat
    
    public init(fromAlpha: CGFloat = 0, toAlpha: CGFloat = 1) {
        self.fromAlpha = fromAlpha
        self.toAlpha = toAlpha
    }
    
    // MARK: - ViewAnimation -
    
    public func prepare(_ view: UIView) {
        view.alpha = fromAlpha
    }
    
    public func perform(for view: UIView) {
        view.alpha = toAlpha
    }
    
}
