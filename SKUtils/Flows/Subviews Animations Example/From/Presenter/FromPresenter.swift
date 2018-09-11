//
//  FromPresenter.swift
//  SKUtils
//
//  Created by Sergey on 11.07.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol FromInterface: class {
    
}

protocol FromOutput {
    
    func viewTriggeredActionEvent()
    
}

class FromPresenter: NSObject {
    
    private weak var view: FromInterface?
    private var router: FromRoutable
    
    init(with view: FromInterface, _ router: FromRoutable) {
        self.view = view
        self.router = router
    }
    
}

// MARK: - FromOutput -

extension FromPresenter: FromOutput {

    func viewTriggeredActionEvent() {
        router.showToExample()
    }

}
