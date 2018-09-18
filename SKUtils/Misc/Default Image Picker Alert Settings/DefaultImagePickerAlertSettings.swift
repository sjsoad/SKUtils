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

struct DefaultImagePickerAlertSettings: ImagePickerAlertSettingsProviding {
    
    let prefferedStyle: UIAlertController.Style
    let alertTitle: String?
    let alertMessage: String?
    let cameraActionTitle: String
    let libraryActionTitle: String
    let cancelActionTitle: String
    
    public init(prefferedStyle: UIAlertController.Style = .actionSheet, alertTitle: String? = nil, alertMessage: String? = nil,
                cameraActionTitle: String = "Camera", libraryActionTitle: String = "Photo Library", cancelActionTitle: String = "Cancel") {
        self.prefferedStyle = prefferedStyle
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
        self.cameraActionTitle = cameraActionTitle
        self.libraryActionTitle = libraryActionTitle
        self.cancelActionTitle = cancelActionTitle
    }
    
}
