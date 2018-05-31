//
//  ImagePickerPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

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

import Foundation
import UIKit
// #1 import module
import SKImagePicking
import SKCameraPermissions
import SKPhotosPermissions
import SKAppSettingsShowing

// #2 add support of ImagePickingInterface
protocol ImagePickerInterface: class, ImagePickingInterface {
    
    func set(image: UIImage?)
    
}

// #3 add support of ImagePickingOutput
protocol ImagePickerOutput: ImagePickingOutput {
    
}

// #4 add support of ImagePicking
class ImagePickerPresenter: NSObject, ImagePicking {

    private weak var view: ImagePickerInterface?
    
    init(with view: ImagePickerInterface) {
        self.view = view
    }
    
    // #5 implement all necessary things of ImagePicking protocol
    // MARK: - ImagePicking -
    
    private(set) var cameraPermissions: CameraPermissions? = CameraPermissions()
    private(set) var photoLibraryPermissions: PhotoLibraryPermissions? = PhotoLibraryPermissions()
    
    var imagePickingInterface: ImagePickingInterface? {
        return view
    }
    
}

// MARK: - ImagePickerPresenterOutput -

extension ImagePickerPresenter: ImagePickerOutput {
    
    func viewTriggeredCallImagePickerEvent() {
        // #6 call showImagePickerAlert to show user alert with options to choose
        let cameraAppSettingsAlert = DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Access to Camera denied. Please, change it in Settings")
        let cameraRollAppSettingsAlert =
        DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Access to Photo Library denied. Please, change it in Settings")
        let imagePickerAlertSettings = ImagePickerAlertSettings(prefferedStyle: .actionSheet, alertTitle: "", alertMessage: "Choose photo from:",
                                                                cameraActionTitle: "Phone Camera", libraryActionTitle: "Camera Roll",
                                                                cancelActionTitle: "Cancel")
        // or
//        let imagePickerAlertSettings = DefaultImagePickerAlertSettings()
        showImagePickerAlert(imagePickerAlertSettings: imagePickerAlertSettings, cameraAppSettingsAlert: cameraAppSettingsAlert,
                             cameraRollAppSettingsAlert: cameraRollAppSettingsAlert)
        // #7 also you can call imagePicker with spurce type dirrectly
//        showImagePicker(with: .photoLibrary)
    }
    
    func viewTriggedImageSelectionEvent(with info: [String: Any]) {
        // #7 handle selection
        let image = info[UIImagePickerControllerEditedImage] as? UIImage
        view?.set(image: image)
    }
    
}
