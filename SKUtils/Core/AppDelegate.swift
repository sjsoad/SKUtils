//
//  AppDelegate.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var servicesRepository = ServicesRepository()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        startApplication()
        return true
    }
    
    // MARK: - Private -
    
    private func startApplication() {
        let mainMenuModule = ModuleBuilder.mainMenuModule(servicesRepository: servicesRepository)
        let navigationController = UINavigationController(rootViewController: mainMenuModule.interface)
        window?.rootViewController = navigationController
    }
    
}
