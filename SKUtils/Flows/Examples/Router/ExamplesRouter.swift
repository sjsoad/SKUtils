//
//  ExamplesRouter.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol ExamplesRoutable {
    
    func pushModule(at indexPath: IndexPath)
    
}

class ExamplesRouter: ExamplesRoutable {
    
    public private(set) weak var viewController: UIViewController?
    private var examples: [BuilderProvidable]
    
    init(with viewController: UIViewController, examples: [BuilderProvidable]) {
        self.viewController = viewController
        self.examples = examples
    }
    
    func pushModule(at indexPath: IndexPath) {
        guard examples.indices.contains(indexPath.row) else { return }
        let example = examples[indexPath.row]
        let nextViewController = example.builder.build()
        viewController?.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
