//
//  UITableView+ReloadAnimation.swift
//  SKUtils
//
//  Created by Sergey on 19.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKAnimator

extension UITableView {
    
    func reload(with animationsProviders: [ViewAnimationProvider], animatorProvider: AnimatorProvider = DefaultAnimatorProvider(),
                delay: TimeInterval = 0.1) {
        reloadData()
        let cells = visibleCells
        prepare(cells: cells, for: animationsProviders)
        for animationProvider in animationsProviders {
            for (index, cell) in cells.enumerated() {
                let animator = animatorProvider.animator()
                animator.addAnimations {
                    animationProvider.perform(for: cell)
                }
                animator.addCompletion { (position) in
                    guard position == .end else {
                        return }
                }
                animator.startAnimation(afterDelay: delay * Double(index))
            }
        }
    }
    
    // MARK: - Private -
    
    private func prepare(cells: [UITableViewCell], for animationsProviders: [ViewAnimationProvider]) {
        cells.forEach { (cell) in
            for animationProvider in animationsProviders {
                animationProvider.prepare(cell)
            }
        }
    }
    
}
