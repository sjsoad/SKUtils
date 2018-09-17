//
//  ToModuleBuilder.swift
//  SKUtils
//
//  Created by Sergey on 11.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct ToModuleBuilder {

    static func build() -> UIViewController {
        let viewController = ToViewController()
        let router = DefaultPopRouter(with: viewController)
        let presenter = ToPresenter(with: viewController, router)
        viewController.presenter = presenter
        return viewController
    }
    
}
