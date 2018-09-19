//
//  ImagePickerViewController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class ImagePickerViewController: UIViewController, ImagePickerInterface {

    var presenter: ImagePickerOutput?

    @IBOutlet private weak var imageView: UIImageView!

    // MARK: - IBActions -
    
    @IBAction func pickImageButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredShowImagePickerAlert()
    }
    
    // MARK: - ImagePickerInterface -
    
    func set(image: UIImage?) {
        imageView.image = image
    }
    
}

// #4 implement UIImagePickerControllerDelegate methods
extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//        picker.dismiss(animated: true, completion: nil)
//        presenter?.viewTriggedImageSelectionEvent(with: info as [String: Any])
    }
    
}
