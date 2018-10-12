//
//  ImagePickerPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
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
    
    private(set) var cameraPermissions: CameraPermissions? = DefaultCameraPermissions()
    private(set) var photoLibraryPermissions: PhotoLibraryPermissions? = DefaultPhotoLibraryPermissions()
    
    var imagePickingInterface: ImagePickingInterface? {
        return view
    }
    
}

// MARK: - ImagePickerOutput -

extension ImagePickerPresenter: ImagePickerOutput {
    
    func viewTriggeredShowImagePickerAlert() {
        // #6 call showImagePickerAlert to show user alert with options to choose
        // Provide strings providers for alerts
        // 1. ImagePickerAlertSettings - configuration for alert controller that will be prompted to user with options to choose source type
        // 2. cameraAppSettingsAlert - configuration for alert controller that will be prompted if user restricted acces to camera
        // 3. cameraRollAppSettingsAlert - configuration for alert controller that will be prompted if user restricted acces to photosLibrary
        // showImagePickerAlert has popoverConfigurationHandler to configure popover in case you showing actionSheet on iPad.
        // imagePickerProvider - you can set custom class, that conforms to protocol ImagePickerProviding, for providing image picker with
        // different configurations
        let cameraAppSettingsAlert =
            DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Access to Camera denied. Please, change it in Settings")
        let cameraRollAppSettingsAlert =
        DefaultAppSettingsAlertStringsProvider(settingsAlertMessage: "Access to Photo Library denied. Please, change it in Settings")
        let prefferedStyle: UIAlertController.Style = UI_USER_INTERFACE_IDIOM() == .phone ? .actionSheet : .alert
        let imagePickerAlertSettings = ImagePickerAlertSettings(prefferedStyle: prefferedStyle, alertTitle: "", alertMessage: "Choose photo from:",
                                                                cameraActionTitle: "Phone Camera", libraryActionTitle: "Camera Roll",
                                                                cancelActionTitle: "Cancel")
        // Also you can set handler for alert presentation, settings presentation, etc.
        showImagePickerAlert(imagePickerAlertSettings: imagePickerAlertSettings) { [weak self] (sourceType) in
            switch sourceType {
            case .camera:
                self?.checkCameraPermissions(with: cameraAppSettingsAlert, authorizedCompletion: { [weak self] in
                    self?.showImagePicker(with: sourceType)
                })
            case .photoLibrary:
                self?.checkCameraRollPermissions(with: cameraRollAppSettingsAlert, authorizedCompletion: {[weak self] in
                    self?.showImagePicker(with: sourceType)
                })
            default:
                print("default implementation")
            }
        }
        
    }
    
    func viewTriggedImageSelectionEvent(with info: [UIImagePickerController.InfoKey: Any]) {
        // #7 handle selection
        let image = info[.originalImage] as? UIImage
        view?.set(image: image)
    }
    
}
