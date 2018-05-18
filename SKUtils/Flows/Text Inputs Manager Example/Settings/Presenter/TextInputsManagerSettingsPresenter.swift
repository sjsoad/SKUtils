//
//  TextInputsManagerSettingsPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

enum ExampleType: Int {
    case view
    case scrolls
}

protocol TextInputsManagerSettingsInterface: class {
    
    var hideOnTap: Bool { get }
    var nextBecomesFirstResponder: Bool { get }
    var handleReturnKey: Bool { get }
    var additionalSpace: Double { get }
    var exampleType: ExampleType { get }
}

protocol TextInputsManagerSettingsOutput {
    
    func viewTriggeredShowExampleEvent()
    
}

class TextInputsManagerSettingsPresenter: NSObject {
    
    private weak var view: TextInputsManagerSettingsInterface?
    
    init(with view: TextInputsManagerSettingsInterface) {
        self.view = view
    }
    
    // MARK: - -
    
}

// MARK: - TextInputsManagerPresenterSettingsOutput -

extension TextInputsManagerSettingsPresenter: TextInputsManagerSettingsOutput {

    func viewTriggeredShowExampleEvent() {
        
    }
    
}
