//
//  PanInteractionController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

class PanInteractionController: NSObject, UIViewControllerInteractiveTransitioning, InteractionControlling, UIGestureRecognizerDelegate {

    private weak var navigationController: UINavigationController?
    private var context: UIViewControllerContextTransitioning?
    private var animator: UIViewPropertyAnimator?
    private var shouldCompleteTransition = false
    open var interactionInProgress = false
    open var completeOnPercentage: CGFloat = 0.5
    
    init(navigationController: UINavigationController) {
        super.init()
        self.navigationController = navigationController
        self.prepareGestureRecognizer(in: navigationController.view)
    }
    
    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        context = transitionContext
    }
    
    private func prepareGestureRecognizer(in view: UIView) {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
    @objc func handleGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let view = gestureRecognizer.view else { return }
        let progress = gestureRecognizer.translation(in: view).y / view.bounds.size.height
        
        switch gestureRecognizer.state {
        case .began:
            interactionInProgress = true
            navigationController?.popViewController(animated: true)
        case .changed:
            shouldCompleteTransition = progress > completeOnPercentage
            context?.updateInteractiveTransition(progress)
        case .cancelled, .ended:
            if interactionInProgress {
                interactionInProgress = false
            }
            if shouldCompleteTransition {
                
            } else {

            }
        default:
            break
        }
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return gestureRecognizer is UIPanGestureRecognizer
    }
    
}
