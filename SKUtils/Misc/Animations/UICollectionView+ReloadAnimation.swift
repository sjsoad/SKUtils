//
//  UICollectionView+ReloadAnimation.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 21.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func reload(with animations: [ViewAnimationProvider]?, random: Bool = false, animatorProvider: AnimatorProvider = DefaultAnimatorProvider(),
                delay: TimeInterval = 0.1) {
        reloadData()
        layoutSubviews()
        guard let animations = animations else { return }
        let cells = random ? visibleCells : sortedCells()
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
    
    private func sortedCells() -> [UICollectionViewCell] {
        return indexPathsForVisibleItems.sorted().compactMap({ cellForItem(at: $0) })
    }
    
    private func prepare(cells: [UICollectionViewCell], for animations: [ViewAnimationProvider]) {
        cells.forEach { (cell) in
            for animation in animations {
                animation.prepare(cell)
            }
        }
    }
    
}
