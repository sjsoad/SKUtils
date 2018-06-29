//
//  PanInteractionController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

class PanInteractionController: UIPercentDrivenInteractiveTransition, InteractionControlling, UIGestureRecognizerDelegate {

    open weak var navigationController: UINavigationController?
    open weak var viewController: UIViewController? {
        didSet {
            guard let view = viewController?.view else {
                return
            }
            prepareGestureRecognizer(in: view)
        }
    }
    private var lastVC: UIViewController?
    private var shouldCompleteTransition = false
    open var interactionInProgress = false
    open var completeOnPercentage: CGFloat = 0.5
    
    init(viewController: UIViewController) {
        super.init()
        self.viewController = viewController
        self.prepareGestureRecognizer(in: viewController.view)
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
            if let navigationController = viewController as? UINavigationController {
                lastVC = navigationController.viewControllers.last
                navigationController.popViewController(animated: true)
            }
//            viewController?.dismiss(animated: true, completion: nil)
        case .changed:
            shouldCompleteTransition = progress > completeOnPercentage
            update(progress)
        case .cancelled, .ended:
            if interactionInProgress {
                interactionInProgress = false
            }
            if shouldCompleteTransition {
                finish()
            } else {
                cancel()
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
