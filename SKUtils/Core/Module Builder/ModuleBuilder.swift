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
    case inputsManagerInView
    case inputsManagerInScroll
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
    
    class func activityViewableModule() -> Module<ActivityViewablePresenter, UIViewController> {
        let viewController = ActivityViewableViewController()
        let presenter = ActivityViewablePresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }
    
    class func alertViewableModule() -> Module<AlertViewablePresenter, UIViewController> {
        let viewController = AlertViewableViewController()
        let presenter = AlertViewablePresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }
    
    class func alertControllerShowingModule() -> Module<AlertControllerShowingPresenter, UIViewController> {
        let viewController = AlertControllerShowingViewController()
        let presenter = AlertControllerShowingPresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }
    
    class func textInputsManagerInViewModule() -> Module<TextInputsManagerPresenter, UIViewController> {
        let viewController = TextInputsManagerViewController(nibName: "TextInputsManagerViewController", bundle: nil)
        let presenter = TextInputsManagerPresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }
    
    class func textInputsManagerInScrollModule() -> Module<TextInputsManagerPresenter, UIViewController> {
        let viewController = TextInputsManagerViewController(nibName: "TextInputsManagerScrollController", bundle: nil)
        let presenter = TextInputsManagerPresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }
    
}
