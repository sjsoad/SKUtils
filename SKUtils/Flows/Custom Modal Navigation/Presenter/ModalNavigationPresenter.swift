//
//  ModalNavigationPresenter.swift
//  SKUtils
//
//  Created by Sergey on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol ModalNavigationInterface: class {
    
}

protocol ModalNavigationOutput {
    
    func viewTriggeredDismissEvent()
    
}

class ModalNavigationPresenter: NSObject {
    
    private weak var view: ModalNavigationInterface?
    
    init(with view: ModalNavigationInterface) {
        self.view = view
    }
    
}

// MARK: - ModalNavigationOutput -

extension ModalNavigationPresenter: ModalNavigationOutput {

    func viewTriggeredDismissEvent() {
        guard let viewController = view as? UIViewController else { return }
        viewController.dismiss(animated: true, completion: nil)
    }

}
