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
        presenter?.viewTriggeredShowActionSheetEvent(sender: sender)
    }
    
    // MARK: - AlertControllerShowingInterface -
    
}
