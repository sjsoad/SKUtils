//
//  ImagePickerPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

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
    
    var prefferedStyle: UIAlertControllerStyle {
        guard UI_USER_INTERFACE_IDIOM() == .phone else { return .alert }
        return .actionSheet
    }
    var cameraActionTitle: String? { return "Camera" }
    var libraryActionTitle: String? { return "Library" }
    var alertTitle: String? { return "Select source" }
    var alertMessage: String? { return nil }
    
    // WARNING: titles for settings alert already decleared in extension in AppSettingsPresenter file
    
}

// MARK: - ImagePickerPresenterOutput -

extension ImagePickerPresenter: ImagePickerOutput {
    
    func viewTriggeredCallImagePickerEvent() {
        // #6 call showImagePickerAlert to show user alert with options to choose
        showImagePickerAlert()
        // #7 also you can call imagePicker with spurce type dirrectly
//        showImagePicker(with: .photoLibrary)
    }
    
    func viewTriggedImageSelectionEvent(with info: [String: Any]) {
        // #7 handle selection
        let image = info[UIImagePickerControllerEditedImage] as? UIImage
        view?.set(image: image)
    }
    
}
