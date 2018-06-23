//
//  ViewAnimationsPresenter.swift
//  SKUtils
//
//  Created by Sergey on 23.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol ViewAnimationsInterface: class {
    
}

protocol ViewAnimationsOutput {
    
}

class ViewAnimationsPresenter: NSObject {
    
    private weak var view: ViewAnimationsInterface?

    init(with view: ViewAnimationsInterface) {
        self.view = view
    }
    
}

// MARK: - ViewAnimationsPresenterOutput -

extension ViewAnimationsPresenter: ViewAnimationsOutput {

}
