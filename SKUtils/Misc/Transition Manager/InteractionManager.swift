//
//  InteractionManager.swift
//  SKUtils
//
//  Created by Sergey on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class InteractionManager: UIPresentationController {
    
    private lazy var dimmingView: UIView! = {
        guard let container = containerView else { return nil }
        let view = UIView(frame: container.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(didTap(tap:)))
        )
        return view
    }()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        presentedViewController.view.addGestureRecognizer(
            UIPanGestureRecognizer(target: self, action: #selector(didPan(pan:)))
        )
    }
    
    @objc func didPan(pan: UIPanGestureRecognizer) {
        guard let view = pan.view, let superView = view.superview, let presented = presentedView, let container = containerView else { return }
        
        let location = pan.translation(in: superView)
        switch pan.state {
        case .began:
            presented.frame.size.height = container.frame.height
        case .changed:
            presented.frame.origin.y = location.y
        case .ended:
                presentedViewController.dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
    @objc func didTap(tap: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        return presentedViewController.view.frame
    }
    
    override func presentationTransitionWillBegin() {
//        guard let container = containerView,
//            let coordinator = presentingViewController.transitionCoordinator else { return }
//
//        dimmingView.alpha = 0
//        container.addSubview(dimmingView)
//        dimmingView.addSubview(presentedViewController.view)
//
//        coordinator.animate(alongsideTransition: { [weak self] (_) in
//            guard let `self` = self else { return }
//            self.dimmingView.alpha = 1
//            }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
//        guard let coordinator = presentingViewController.transitionCoordinator else { return }
//
//        coordinator.animate(alongsideTransition: { [weak self] (_) -> Void in
//            guard let `self` = self else { return }
//            self.dimmingView.alpha = 0
//            }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
//        if completed {
//            dimmingView.removeFromSuperview()
//        }
    }
    
}
