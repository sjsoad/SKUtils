//
//  AppSettingsPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

// WARNING: You can create class that conforms to AppSettingsAlertStringsProviding and make assign values in init

class DefaultAppSettingsAlertStringsProvider: AppSettingsAlertStringsProviding {
    
    private(set) var settingsAlertTitle: String?
    private(set) var settingsAlertMessage: String?
    private(set) var settingsActionTitle: String
    private(set) var cancelActionTitle: String
    
    init(settingsAlertTitle: String? = "Access Denied", settingsAlertMessage: String? = "Need to change access state in Settings",
         settingsActionTitle: String = "Open Settings", cancelActionTitle: String = "Continue anyway") {
        self.settingsAlertTitle = settingsAlertTitle
        self.settingsAlertMessage = settingsAlertMessage
        self.settingsActionTitle = settingsActionTitle
        self.cancelActionTitle = cancelActionTitle
    }
    
}

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

// MARK: - AppSettingsPresenterOutput -

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
        showAppSettingsAlert(with: stringsProvider, alertPresentingCompletion: {
            print("alert presented")
        }, appSettingsShowingCompletion: { opened in
            print("Settings app opened: \(opened)")
        })
    }

}
