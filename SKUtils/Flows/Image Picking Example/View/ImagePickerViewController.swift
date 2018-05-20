//
//  ImagePickerViewController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
// #1 import module
import SKImagePicking

class ImagePickerViewController: UIViewController, ImagePickerInterface {

    var presenter: ImagePickerOutput?

    @IBOutlet private weak var imageView: UIImageView!

    // MARK: - IBActions -
    
    @IBAction func pickImageButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredCallImagePickerEvent()
    }
    
    // MARK: - ImagePickerInterface -
    
    func set(image: UIImage?) {
        imageView.image = image
    }
    
    // MARK: - ImagePickingInterface -
    
    // #2 Optionaly you can override
    var imagePickerController: UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = delegate
        imagePicker.allowsEditing = true
        return imagePicker
    }
//    var delegate: (UIImagePickerControllerDelegate & UINavigationControllerDelegate)? can be overriden
    
}

// #3 implement UIImagePickerControllerDelegate methods
extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        picker.dismiss(animated: true, completion: nil)
        presenter?.viewTriggedImageSelectionEvent(with: info)
    }
    
}
