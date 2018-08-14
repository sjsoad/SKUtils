//
//  AppSettingsPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
// #1 import module
import SKAppSettingsShowing

// #2 add support of AppSettingsShowingInterface protocol
protocol AppSettingsInterface: class, AppSettingsShowingInterface {
    
}

protocol AppSettingsOutput {
    
    func viewTriggeredShowSettingsEvent()
    
}

// #3 add support of AppSettingsShowing protocol
class AppSettingsPresenter: NSObject, AppSettingsShowing {
    
    private weak var view: AppSettingsInterface?

    init(with view: AppSettingsInterface) {
        self.view = view
    }
    
    // #4 implement necessary things of AppSettingsShowing protocol
    // MARK: - AppSettingsShowing -
    
    var appSettingsShowingInterface: AppSettingsShowingInterface? {
        return view
    }
    
}

// MARK: - AppSettingsOutput -

extension AppSettingsPresenter: AppSettingsOutput {

    func viewTriggeredShowSettingsEvent() {
        // #5 call showAppSettingsAlert to show alert, optionaly can assign handler that will be called when alert is presented and when
        // AppSettingsAlertStringsProvider provides titles for alert and alert actions
        // Settings app will be opened
        // Provide AppSettingsAlertStringsProvider
//        let stringsProvider = AppSettingsAlertStringsProvider(settingsAlertTitle: nil, settingsAlertMessage: "Message",
//                                                              settingsActionTitle: "Go To Settings", cancelActionTitle: "Cancel")
        // or
        let stringsProvider = DefaultAppSettingsAlertStringsProvider()  // check Service Permissions Example for advanced example
//        showAppSettingsAlert(with: stringsProvider)
        showAppSettingsAlert(with: stringsProvider, alertPresentingCompletion: {
            print("alert presented")
        }, appSettingsShowingCompletion: { opened in
            print("Settings app opened: \(opened)")
        })
    }

}
