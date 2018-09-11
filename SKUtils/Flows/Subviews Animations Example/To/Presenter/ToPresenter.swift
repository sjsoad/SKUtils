//
//  ToPresenter.swift
//  SKUtils
//
//  Created by Sergey on 11.07.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol ToInterface: class {
    
}

protocol ToOutput {
    
    func viewTriggeredBackEvent()
    
}

class ToPresenter: NSObject {
    
    private weak var view: ToInterface?
    
    private var router: Popable
    
    init(with view: ToInterface, _ router: Popable) {
        self.view = view
        self.router = router
    }
    
}

// MARK: - ToOutput -

extension ToPresenter: ToOutput {

    func viewTriggeredBackEvent() {
        router.popViewController(animated: true)
    }

}
