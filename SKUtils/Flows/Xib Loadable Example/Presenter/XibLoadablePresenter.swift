//
//  XibLoadablePresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol XibLoadableInterface: class {
    
}

protocol XibLoadableOutput {
    
}

class XibLoadablePresenter: NSObject {
    
    private weak var view: XibLoadableInterface?
    
    init(with view: XibLoadableInterface) {
        self.view = view
    }
    
}

// MARK: - XibLoadableOutput -

extension XibLoadablePresenter: XibLoadableOutput {

}
