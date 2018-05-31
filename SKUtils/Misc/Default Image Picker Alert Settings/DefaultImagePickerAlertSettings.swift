//
//  DefaultImagePickerAlertSettings.swift
//  SKUtils
//
//  Created by Sergey on 31.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKImagePicking

// WARNING: You can create class that conforms to ImagePickerAlertSettingsProviding and make assign values in init

class DefaultImagePickerAlertSettings: ImagePickerAlertSettingsProviding {
    
    private(set) var prefferedStyle: UIAlertControllerStyle
    private(set) var alertTitle: String?
    private(set) var alertMessage: String?
    private(set) var cameraActionTitle: String
    private(set) var libraryActionTitle: String
    private(set) var cancelActionTitle: String
    
    public required init(prefferedStyle: UIAlertControllerStyle = .actionSheet, alertTitle: String? = nil, alertMessage: String? = nil,
                         cameraActionTitle: String = "Camera", libraryActionTitle: String = "Photo Library", cancelActionTitle: String = "Cancel") {
        self.prefferedStyle = prefferedStyle
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
        self.cameraActionTitle = cameraActionTitle
        self.libraryActionTitle = libraryActionTitle
        self.cancelActionTitle = cancelActionTitle
    }
    
}
