//
//  DefaultAppSettingsAlertStringsProvider.swift
//  SKUtils
//
//  Created by Sergey on 31.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKAppSettingsShowing

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
