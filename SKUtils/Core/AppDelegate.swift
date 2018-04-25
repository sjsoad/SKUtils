//
//  AppDelegate.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import TextInputsManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        startApplication()
        return true
    }
    
    // MARK: - Private -
    
    private func startApplication() {
        window = UIWindow(frame: UIScreen.main.bounds)
        TextInputsManagerPresenter.showView(in: window)
        
    }
    
}
