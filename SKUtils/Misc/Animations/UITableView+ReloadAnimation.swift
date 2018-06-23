//
//  UITableView+ReloadAnimation.swift
//  SKUtils
//
//  Created by Sergey on 19.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reload(with animations: [ViewAnimationProvider]?, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(),
                delay: TimeInterval = 0.1) {
        reloadData()
        guard let animations = animations else { return }
        let cells = visibleCells
        prepare(cells: cells, for: animations)
        for (index, cell) in cells.enumerated() {
            let animator = animatorProvider.animator()
            animator.addAnimations {
                for animation in animations {
                    animation.perform(for: cell)
                }
            }
            animator.startAnimation(afterDelay: delay * Double(index))
        }
    }
    
    // MARK: - Private -
    
    private func prepare(cells: [UITableViewCell], for animations: [ViewAnimationProvider]) {
        cells.forEach { (cell) in
            for animation in animations {
                animation.prepare(cell)
            }
        }
    }
    
}
