//
//  AlertViewablePresenter.swift
//  SKUtils
//
//  Created by Sergey on 18.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
// #1 import modules
import SKAlertViewable
import SwiftyDrop

// #2 make sure your interface conforms to protocol AlertViewable
protocol AlertViewableInterface: class, AlertViewable {
    
}

protocol AlertViewableOutput {
    
    func viewTriggredShowAlertEvent()
    
}

class AlertViewablePresenter: NSObject {
    
    private weak var view: AlertViewableInterface?
    
    init(with view: AlertViewableInterface) {
        self.view = view
    }
    
}

// MARK: - AlertViewableOutput -

extension AlertViewablePresenter: AlertViewableOutput {

    func viewTriggredShowAlertEvent() {
        // #3 call show method with message and state, for more details check SwiftyDrop github
        view?.show(message: "Alert Viewable Example", state: .info)
    }

}
