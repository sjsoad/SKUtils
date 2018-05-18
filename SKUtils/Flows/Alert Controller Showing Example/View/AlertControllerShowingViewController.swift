//
//  AlertControllerShowingViewController.swift
//  SKUtils
//
//  Created by Sergey on 18.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class AlertControllerShowingViewController: UIViewController, AlertControllerShowingExampleInterface {

    var presenter: AlertControllerShowingOutput?

    @IBOutlet private weak var actionSheetButton: UIButton!
    
    // MARK: - IBActions -
    
    @IBAction func showAlertButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredShowAlertEvent()
    }

    @IBAction func showActionSheetButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredShowActionSheetEvent()
    }
    
    // MARK: - AlertControllerShowingInterface -
    
}

// #1 If you are showing action sheet on iPad you should implement UIPopoverPresentationControllerDelegate

extension AlertControllerShowingViewController: UIPopoverPresentationControllerDelegate {
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.canOverlapSourceViewRect = false
        popoverPresentationController.sourceView = actionSheetButton
        popoverPresentationController.sourceRect = actionSheetButton.frame
    }
    
}
