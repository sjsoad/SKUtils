//
//  ActivityViewableModuleBuilder.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct ActivityViewableModuleBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        let viewController = ActivityViewableViewController()
        let router = DefaultPopRouter(with: viewController)
        let presenter = ActivityViewablePresenter(with: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
}
