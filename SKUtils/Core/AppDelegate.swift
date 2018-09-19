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
    private var appDelegateRouter: AppDelegateRoutable?
        
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
        window = UIWindow(frame: UIScreen.main.bounds)
        appDelegateRouter = AppDelegateRouter(with: window)
        appDelegateRouter?.startApplication()
        return true
    }
    
}
