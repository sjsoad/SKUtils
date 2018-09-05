//
//  AppSettingsBuilder.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct AppSettingsBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        let viewController = AppSettingsViewController()
        let presenter = AppSettingsPresenter(with: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
}
