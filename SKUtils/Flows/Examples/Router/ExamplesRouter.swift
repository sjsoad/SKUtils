//
//  ExamplesRouter.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

protocol ExamplesRoutable {
    
    func showExample(at indexPath: IndexPath)
    
}

struct ExamplesRouter: ExamplesRoutable {
    
    private weak var viewController: UIViewController?
    private var examples: [[BuilderProvidable]]
    private var customModalTransition: TransitioningDelegate = {
        return DefaultTransitioningDelegate(animatedTransitioning: Page(transitionDirection: .fromTop))
    }()
    
    init(with viewController: UIViewController, _ examples: [[BuilderProvidable]]) {
        self.viewController = viewController
        self.examples = examples
    }
    
    func showExample(at indexPath: IndexPath) {
        guard let example = example(at: indexPath) else { return }
        let nextViewController = example.builder.build()
        if indexPath.section == 0 {
            push(nextViewController)
        } else {
            present(nextViewController)
        }
    }
    
    // MARK: - Private -
    
    private func example(at indexPath: IndexPath) -> BuilderProvidable? {
        guard examples.indices.contains(indexPath.section) else { return nil }
        let examplesSection = examples[indexPath.section]
        guard examplesSection.indices.contains(indexPath.row) else { return nil }
        return examplesSection[indexPath.row]
    }
    
    private func push(_ nextViewController: UIViewController) {
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func present(_ nextViewController: UIViewController) {
        nextViewController.transitioningDelegate = customModalTransition
        viewController?.present(nextViewController, animated: true, completion: nil)
    }
    
}
