//
//  AlertControllerShowingPresenter.swift
//  SKUtils
//
//  Created by Sergey on 18.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
// #1 import Module
import AlertActionBuilder
import SKAlertControllerShowing

// #2 make sure your interface conforms to protocol AlertControllerShowingInterface
protocol AlertControllerShowingExampleInterface: class, AlertControllerShowingInterface {
    
}

protocol AlertControllerShowingOutput {
    
    func viewTriggeredShowAlertEvent()
    func viewTriggeredShowActionSheetEvent()
    
}

class AlertControllerShowingPresenter: NSObject {
    
    private weak var view: AlertControllerShowingExampleInterface?
    
    init(with view: AlertControllerShowingExampleInterface) {
        self.view = view
    }
    
    // MARK: - Private -
    
    private func showAlertController(with style: UIAlertControllerStyle) {
        // #3 use AlertActionConfig for creating alert controller actions
        let defaultAction = AlertActionConfig(title: "Default Action", style: .default) { (_) in
            print("action handler")
        }
        let destructiveAction = AlertActionConfig(title: "Destructive Action", style: .destructive) { (_) in
            print("action handler")
        }
        let cancelAction = AlertActionConfig(title: "Cancel", style: .cancel) { (_) in
            print("action handler")
        }
        // #4 call showAlertController with configurations
        view?.showAlertController(with: "Title", message: "Message", actionsConfiguration: [defaultAction, destructiveAction, cancelAction],
                                  preferredStyle: style, completion: {
                                    print("completion of presenting")
        })
    }
    
}

// MARK: - AlertControllerShowingPresenterOutput -

extension AlertControllerShowingPresenter: AlertControllerShowingOutput {

    func viewTriggeredShowAlertEvent() {
        showAlertController(with: .alert)
    }
    
    func viewTriggeredShowActionSheetEvent() {
        showAlertController(with: .actionSheet)
    }

}
