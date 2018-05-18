//
//  ModuleBuilder.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

enum ModuleType {
    case activityViewable
    case alertControllerShowing
    case alertViewable
    case servicePermissions
    case imagePicking
    case inputsManager
    case textInputs
    case pickerViewManager
    case validationService
    case xibLoadable
    case dataSources
}

class ModuleBuilder: NSObject {

    class func mainMenuModule(servicesRepository: ServicesRepository) -> Module<MainMenuPresenter, UIViewController> {
        let viewController = MainMenuViewController()
        let presenter = MainMenuPresenter(with: viewController, servicesRepository: servicesRepository)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }
    
    class func inputsManagerModule() -> Module<TextInputsManagerPresenter, UIViewController> {
        let viewController = TextInputsManagerViewController()
        let presenter = TextInputsManagerPresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }
    
}
