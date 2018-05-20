//
//  AppSettingsPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
// #1 import module
import SKAppSettingsShowing

// #1.1 write extension and declear default values if all calls of settings alert will have same texts
extension AppSettingsShowing {
    
    var settingsActionTitle: String? { return "Go To Settings" }
    var cancelActionTitle: String? { return "Cancel" }
    var settingsAlertTitle: String? { return "Warning" }
    var settingsAlertMessage: String? { return "Change somethings in Settings" }
    
}

// #2 add support of AppSettingsShowingInterface protocol
protocol AppSettingsInterface: class, AppSettingsShowingInterface {
    
}

protocol AppSettingsOutput {
    
    func viewTriggeredShowSettingsEvent()
    
}

// #3 add support of AppSettingsShowing protocol
class AppSettingsPresenter: NSObject, AppSettingsShowing {
    
    private weak var view: AppSettingsInterface?

    init(with view: AppSettingsInterface) {
        self.view = view
    }
    
    // #4 implement all necessary things of AppSettingsShowing protocol
    // MARK: - AppSettingsShowing -
    
    var appSettingsShowingInterface: AppSettingsShowingInterface? {
        return view
    }
    
    // #4.1 override or declear texts
    var settingsAlertTitle: String? { return "Hey you should go to Settings" }
    
}

// MARK: - AppSettingsPresenterOutput -

extension AppSettingsPresenter: AppSettingsOutput {

    func viewTriggeredShowSettingsEvent() {
        showAppSettingsAlert()
    }

}
