//
//  AppDelegate.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var navControllerDelegate: DefaultNavigationControllerDelegate?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        startApplication()
        return true
    }
    
    // MARK: - Private -
    
    private func startApplication() {
//        let mainMenuVC = ModuleBuilder.mainMenuModule(servicesRepository: servicesRepository)
//        let navigationController = UINavigationController(rootViewController: mainMenuVC)
//        navigationController.delegate = delegate(for: navigationController)
//        window?.rootViewController = navigationController
    }
    
    private func delegate(for navigationController: UINavigationController) -> DefaultNavigationControllerDelegate? {
        let panInteractionController = PanInteractionController(navigationController: navigationController)
        navControllerDelegate = DefaultNavigationControllerDelegate(with: panInteractionController)
        return navControllerDelegate
    }
    
}
