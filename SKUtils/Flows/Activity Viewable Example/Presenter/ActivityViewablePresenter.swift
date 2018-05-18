//
//  ActivityViewablePresenter.swift
//  SKUtils
//
//  Created by Sergey on 18.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
// #1 import module
import SKActivityViewable

// #2 make sure your interface conforms to protocol ActivityViewable
protocol ActivityViewableInterface: class, ActivityViewable {
    
}

protocol ActivityViewableOutput {
    
    func viewTriggeredShowActivityEvent()
    
}

class ActivityViewablePresenter: NSObject {
    
    private weak var view: ActivityViewableInterface?
    
    init(with view: ActivityViewableInterface) {
        self.view = view
    }
    
}

// MARK: - ActivityViewablePresenterOutput -

extension ActivityViewablePresenter: ActivityViewableOutput {

    func viewTriggeredShowActivityEvent() {
        // #3 call showActivity method to show activity
        view?.showActivity()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            // #4 call hideActivity method to hide activity
            self?.view?.hideActivity()
        }
    }

}
