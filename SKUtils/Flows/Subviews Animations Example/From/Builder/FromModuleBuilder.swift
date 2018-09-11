//
//  FromModuleBuilder.swift
//  SKUtils
//
//  Created by Sergey on 11.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct FromModuleBuilder: ModuleBuilder {

    func build() -> UIViewController {
        let viewController = FromViewController()
        let router = FromRouter(with: viewController)
        let presenter = FromPresenter(with: viewController, router)
        viewController.presenter = presenter
        return viewController
    }
    
}
