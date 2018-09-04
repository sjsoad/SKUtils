//
//  ExamplesModuleBuilder.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct ExamplesModuleBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        let viewController = ExamplesViewController()
        let router = ExamplesRouter(with: viewController, examples: TestsDataProvider.examples())
        let presenter = ExamplesPresenter(with: viewController, router: router, examples: TestsDataProvider.examples())
        viewController.presenter = presenter
        return viewController
    }
    
}
