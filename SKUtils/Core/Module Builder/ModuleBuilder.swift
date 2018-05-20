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
    case alertViewable
    case alertControllerShowing
    case inputsManagerInView
    case inputsManagerInScroll
    case textInputs
    case xibLoadable
    case appSettings
    case imagePicking
    case servicePermissions
    case validationService
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
    
    class func textInputsModule() -> Module<TextInputsPresenter, UIViewController> {
        let viewController = TextInputsViewController()
        let presenter = TextInputsPresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }

    class func xibLoadableModule() -> Module<XibLoadablePresenter, UIViewController> {
        let viewController = XibLoadableViewController()
        let presenter = XibLoadablePresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }

    class func appSettingsModule() -> Module<AppSettingsPresenter, UIViewController> {
        let viewController = AppSettingsViewController()
        let presenter = AppSettingsPresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }
    
    class func servicePermissionsModule() -> Module<ServicePermissionsPresenter, UIViewController> {
        let viewController = ServicePermissionsViewController()
        let presenter = ServicePermissionsPresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }

    class func imagePickerModule() -> Module<ImagePickerPresenter, UIViewController> {
        let viewController = ImagePickerViewController()
        let presenter = ImagePickerPresenter(with: viewController)
        viewController.presenter = presenter
        return Module(presenter: presenter, interface: viewController)
    }
    
}
