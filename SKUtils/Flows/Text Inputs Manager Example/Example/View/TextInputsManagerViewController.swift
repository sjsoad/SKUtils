//
//  TextInputsManagerViewController.swift
//  SKUtils
//
//  Created by Sergey on 18.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
// #1 import module
import SKTextInputsManager

class TextInputsManagerViewController: UIViewController, TextInputsManagerInterface {

    var presenter: TextInputsManagerOutput?

    // #1 add TextInputsManager property
    @IBOutlet private var textInputsManager: TextInputsManager!
    
    /*
    private var textInputsManager: TextInputsManager = {
        let textInputsManager = TextInputsManager()
        textInputsManager.reloadTextFieldsManager()
        return textInputsManager
    }()
     */
    
    // MARK: - Lifecycle -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        textInputsManager.returnKeyProvider = { (index, isLast) -> UIReturnKeyType in
//            guard isLast else { return .next }
//            return .done
//        }
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
