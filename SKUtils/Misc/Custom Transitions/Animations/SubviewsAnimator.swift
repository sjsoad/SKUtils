//
//  SubviewsAnimator.swift
//  SKUtils
//
//  Created by Sergey on 10.07.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

//protocol SubviewsForAnimatedTransitionProviding {
//    var subviewsToAnimate: [UIView] { get }
//}

//extension SubviewsForAnimatedTransitionProviding where Self: UIViewController {
//    
//    var subviewsToAnimate: [UIView] {
//        return []
//    }
//    
//}

class SubviewsAnimator: NSObject {

//    private var fromSnapshots: [UIView] = []
//    private var toSnapshots: [UIView] = []
//    private weak var fromVC: SubviewsForAnimatedTransitionProviding?
//    private weak var toVC: SubviewsForAnimatedTransitionProviding?
    
    override init() {
        
    }
    
    func prepare(transitionContext: UIViewControllerTransitionCoordinatorContext) {
//        guard let fromVC = transitionContext.viewController(forKey: .from) as? SubviewsForAnimatedTransitionProviding,
//        let toVC = transitionContext.viewController(forKey: .to) as? SubviewsForAnimatedTransitionProviding else { return }
//        let container = transitionContext.containerView

//        fromSnapshots = fromVC.subviewsToAnimate.map { subview -> UIView in
//            guard let snapshot = subview.snapshotView(afterScreenUpdates: false) else { return nil }
//            snapshot.frame = container.convert(subview.frame, from: subview.superview)
//            return snapshot
//        }
//
//        toSnapshots = toVC.subviewsToAnimate.map { subview -> UIView in
//            guard let snapshot = subview.snapshotView(afterScreenUpdates: true) else { return nil }
//            snapshot.frame = container.convert(subview.frame, from: subview.superview)
//            return snapshot
//        }
//
//        let frames = zip(fromSnapshots, toSnapshots).map { ($0.frame, $1.frame) }
//
//        zip(toSnapshots, frames).forEach { snapshot, frame in
//            snapshot.frame = frame.0
//            snapshot.alpha = 0
//            container.addSubview(snapshot)
//        }
//
//        fromSnapshots.forEach { container.addSubview($0) }
//        fromVC.subviews.forEach { $0.alpha = 0 }
//        toVC.subviews.forEach { $0.alpha = 0 }
    }
    
    func perform() {
//        zip(toSnapshots, frames).forEach { snapshot, frame in
//            snapshot.frame = frame.1
//            snapshot.alpha = 1
//        }
//
//        zip(fromSnapshots, frames).forEach { snapshot, frame in
//            snapshot.frame = frame.1
//            snapshot.alpha = 0
//        }
    }
    
    func complete() {
//        fromSnapshots.forEach { $0.removeFromSuperview() }
//        toSnapshots.forEach   { $0.removeFromSuperview() }
//        fromVC.subviews.forEach { $0.alpha = 1 }
//        toVC.subviews.forEach { $0.alpha = 1 }
    }
    
}
