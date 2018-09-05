//
//  AppDelegateRouter.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

protocol AppDelegateRoutable {
    
    func startApplication()
    
}

class AppDelegateRouter: AppDelegateRoutable {

    private weak var window: UIWindow?
    
    private var navControllerDelegate: NavigationControllerDelegate?
    
    init(with window: UIWindow?) {
        self.window = window
    }
    
    func startApplication() {
        let examplesModule = ExamplesModuleBuilder.build()
        let navigationController = UINavigationController(rootViewController: examplesModule)
        navigationController.delegate = delegate(for: navigationController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    // MARK: - Private -
    
    private func delegate(for navigationController: UINavigationController) -> NavigationControllerDelegate? {
        let panInteractionController = PanInteractionController(navigationController: navigationController)
        navControllerDelegate = DefaultNavigationControllerDelegate(with: panInteractionController)
        return navControllerDelegate
    }
    
}
