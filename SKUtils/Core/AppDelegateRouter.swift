//
//  AppDelegateRouter.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol AppDelegateRoutable {
    
    func startApplication()
    
}

class AppDelegateRouter: AppDelegateRoutable {

    private weak var window: UIWindow?
    
    init(with window: UIWindow?) {
        self.window = window
    }
    
    func startApplication() {
        
        window?.makeKeyAndVisible()
    }
    
}
