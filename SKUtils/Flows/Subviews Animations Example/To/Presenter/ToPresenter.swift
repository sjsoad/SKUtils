//
//  ToPresenter.swift
//  SKUtils
//
//  Created by Sergey on 11.07.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol ToInterface: class, Navigatable {
    
}

protocol ToOutput {
    
    func viewTriggeredBackEvent()
    
}

class ToPresenter: NSObject {
    
    private weak var view: ToInterface?
    
    init(with view: ToInterface) {
        self.view = view
    }
    
}

// MARK: - ToPresenterOutput -

extension ToPresenter: ToOutput {

    func viewTriggeredBackEvent() {
        view?.navigationController?.popViewController(animated: true)
    }

}
