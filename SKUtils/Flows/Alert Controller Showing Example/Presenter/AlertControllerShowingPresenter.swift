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
    func viewTriggeredShowActionSheetEvent(sender: UIView)
    
}

class AlertControllerShowingPresenter: NSObject {
    
    private weak var view: AlertControllerShowingExampleInterface?
    
    init(with view: AlertControllerShowingExampleInterface) {
        self.view = view
    }
    
    // MARK: - Private -
    
    private func showAlertController(with style: UIAlertControllerStyle, sender: UIView? = nil) {
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
        // Use one of 2 provided methods
//        view?.showAlertController(with: <#T##String?#>, message: <#T##String?#>, actionsConfiguration: <#T##[AlertActionConfig]#>,
//        preferredStyle: <#T##UIAlertControllerStyle#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        view?.showAlertController(with: "Title", message: "Message", actionsConfiguration: [defaultAction, destructiveAction, cancelAction],
                                  preferredStyle: style, completion: {
                                    print("completion of presenting")
        }, popoveConfigurationHandler: { (presentationController) in
            // #5 configure poper controller if needed - required for actions sheet on iPad, in other cases can be ignored
            presentationController.canOverlapSourceViewRect = true
            presentationController.sourceView = sender
            presentationController.sourceRect = sender?.frame ?? .zero
        })
        
    }
    
}

// MARK: - AlertControllerShowingPresenterOutput -

extension AlertControllerShowingPresenter: AlertControllerShowingOutput {

    func viewTriggeredShowAlertEvent() {
        showAlertController(with: .alert)
    }
    
    func viewTriggeredShowActionSheetEvent(sender: UIView) {
        showAlertController(with: .actionSheet, sender: sender)
    }

}
