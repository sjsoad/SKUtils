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
protocol TextInputsManagerInterface: class, KeyboardHiding, TextInputsClearing, TextInputsManagerReloading {
    
}

protocol TextInputsManagerOutput {
    
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

// MARK: - TextInputsManagerOutput -

extension TextInputsManagerPresenter: TextInputsManagerOutput {
    
    func viewTriggeredHideKeyboardEvent() {
        view?.hideKeyboard()
    }
    
    func viewTriggeredClearEvent() {
        view?.clearTextInputs()
    }
    
    func viewTriggeredReloadEvent() {
        view?.reloadTextInputsManager()
    }
    
}
