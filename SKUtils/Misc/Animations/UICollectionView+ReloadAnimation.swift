//
//  UICollectionView+ReloadAnimation.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 21.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

extension UICollectionView {
    
    func reload(with animationsProviders: [ViewAnimationProvider], random: Bool = false,
                animatorProvider: AnimatorProvider = DefaultAnimatorProvider(), delay: TimeInterval = 0.1) {
        reloadData()
        layoutSubviews()
        let cells = random ? visibleCells : sortedCells()
        prepare(cells: cells, for: animationsProviders)
        for (index, cell) in cells.enumerated() {
            let animator = animatorProvider.animator()
            animator.addAnimations {
                for animationProvider in animationsProviders {
                    animationProvider.perform(for: cell)
                }
            }
            animator.startAnimation(afterDelay: delay * Double(index))
        }
    }
    
    // MARK: - Private -
    
    private func sortedCells() -> [UICollectionViewCell] {
        return indexPathsForVisibleItems.sorted().compactMap({ cellForItem(at: $0) })
    }
    
    private func prepare(cells: [UICollectionViewCell], for animationsProviders: [ViewAnimationProvider]) {
        cells.forEach { (cell) in
            for animationProvider in animationsProviders {
                animationProvider.prepare(cell)
            }
        }
    }
    
}
