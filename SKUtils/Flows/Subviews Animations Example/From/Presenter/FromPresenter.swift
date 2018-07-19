//
//  FromPresenter.swift
//  SKUtils
//
//  Created by Sergey on 11.07.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol FromInterface: class, Navigatable {
    
}

protocol FromOutput {
    
    func viewTriggeredActionEvent()
    
}

class FromPresenter: NSObject {
    
    private weak var view: FromInterface?
    
    init(with view: FromInterface) {
        self.view = view
    }
    
}

// MARK: - FromPresenterOutput -

extension FromPresenter: FromOutput {

    func viewTriggeredActionEvent() {
        let toModule = ModuleBuilder.toModule()
        view?.navigationController?.pushViewController(toModule.interface, animated: true)
    }

}