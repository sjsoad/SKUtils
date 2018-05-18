//
//  TextInputsManagerViewController.swift
//  SKUtils
//
//  Created by Sergey on 18.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
// #1 import module
import SKTextInputsManager

class TextInputsManagerViewController: UIViewController, TextInputsManagerInterface {

    var presenter: TextInputsManagerOutput?

    // #1 add TextInputsManager property
    @IBOutlet private var textInputsManager: TextInputsManager!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    // MARK: - IBActions -
    
    @IBAction func hideKeyboardButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredHideKeyboardEvent()
    }
    
    @IBAction func clearTextInputsButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredClearEvent()
    }
    
    @IBAction func reloadTextFieldsManagerButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredReloadEvent()
    }
    
    // MARK: - TextInputsManagerInterface -
    
    func hideKeyboard() {
        // # hides keyboard
        textInputsManager.hideKeyboard()
    }
    
    func clearTextInputs() {
        // # clears all text inputs
        textInputsManager.clearTextInputs()
    }
    
    func reloadTextFieldsManager() {
        // # if you add field dynamically by code - you can reload manager, so that manager search and collected all fields again
        textInputsManager.reloadTextFieldsManager()
    }
    
}
