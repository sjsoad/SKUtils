//
//  PanInteractionController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

class PanInteractionController: NSObject, InteractionControlling, UIGestureRecognizerDelegate {

    // MARK: - Your properties -
    
    private weak var navigationController: UINavigationController?
    private var shouldCompleteTransition = false
    private var completeOnPercentage: CGFloat = 0.5
    private var panGesture: UIPanGestureRecognizer?
    
    // MARK: - InteractionControlling -
    
    open weak var interactionDelegate: InteractionControllingDelegate?
    open var interactionInProgress = false
    
    func activate() {
        guard let panGesture = panGesture, !viewHasGesture(panGesture) else { return }
        navigationController?.view.addGestureRecognizer(panGesture)
    }
    
    func deactivate() {
        guard let panGesture = panGesture, viewHasGesture(panGesture) else { return }
        navigationController?.view.removeGestureRecognizer(panGesture)
    }
    
    // MARK: - Lifecycle -
    
    deinit {
        deactivate()
    }
    
    init(navigationController: UINavigationController?) {
        super.init()
        self.navigationController = navigationController
        self.panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        self.panGesture?.delegate = self
        activate()
    }
    
    // MARK: - Private -
    
    private func viewHasGesture(_ gesture: UIPanGestureRecognizer) -> Bool {
        return navigationController?.view.gestureRecognizers?.contains(gesture) ?? false
    }
    
    // MARK: - UIViewControllerInteractiveTransitioning -
    
    func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
    // MARK: - Gesture Handler -
    
    @objc func handleGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let view = gestureRecognizer.view else { return }
        let progress = gestureRecognizer.translation(in: view).y / view.bounds.size.height
        
        switch gestureRecognizer.state {
        case .began:
            interactionInProgress = true
            navigationController?.popViewController(animated: true)
        case .changed:
            shouldCompleteTransition = progress > completeOnPercentage
            interactionDelegate?.interactionDidUpdate(with: progress)
        case .cancelled, .ended:
            interactionInProgress = false
            if shouldCompleteTransition {
                interactionDelegate?.interactionDidEnded()
            } else {
                interactionDelegate?.interactionDidCanceled()
            }
        default:
            break
        }
    }
    
    // MARK: - UIGestureRecognizerDelegate -
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return gestureRecognizer is UIPanGestureRecognizer
    }
    
}
