//
//  TextInputsManagerPresenter.swift
//  SKUtils
//
//  Created by Sergey on 18.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
// #1 import module
import SKTextInputsManager

// #2 optionally: add support of protocol to your interface in case you want some custom actions or controlling behavior
protocol TextInputsManagerInterface: class, KeyboardHiding, TextInputsClearing, TextFieldsManagerReloading {
    
//    var hideOnTap: Bool { set }
//    var nextBecomesFirstResponder: Bool { set }
//    var handleReturnKey: Bool { set }
//    var additionalSpace: Double { set }
    
}

protocol TextInputsManagerOutput {
    
    func viewDidLoad()
    func viewTriggeredHideKeyboardEvent()
    func viewTriggeredClearEvent()
    func viewTriggeredReloadEvent()
    
}

class TextInputsManagerPresenter: NSObject {
    
    private weak var view: TextInputsManagerInterface?
    
    init(with view: TextInputsManagerInterface) {
        self.view = view
    }
    
}

// MARK: - TextInputsManagerPresenterOutput -

extension TextInputsManagerPresenter: TextInputsManagerOutput {

    func viewDidLoad() {
        
    }
    
    func viewTriggeredHideKeyboardEvent() {
        view?.hideKeyboard()
    }
    
    func viewTriggeredClearEvent() {
        view?.clearTextInputs()
    }
    
    func viewTriggeredReloadEvent() {
        view?.reloadTextFieldsManager()
    }
    
}
