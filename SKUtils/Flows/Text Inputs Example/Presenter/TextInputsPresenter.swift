//
//  TextInputsPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol TextInputsInterface: class {
    
}

protocol TextInputsOutput {
    
}

class TextInputsPresenter: NSObject {
    
    private weak var view: TextInputsInterface?
    
    init(with view: TextInputsInterface) {
        self.view = view
    }
    
}

// MARK: - TextInputsPresenterOutput -

extension TextInputsPresenter: TextInputsOutput {


}
