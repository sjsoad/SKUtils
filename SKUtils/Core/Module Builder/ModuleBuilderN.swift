//
//  ModuleBuilder.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKImagePreviewing

//struct ModuleBuilder {

//    static func mainMenuModule(servicesRepository: ServicesRepository) -> UIViewController {
//        let viewController = MainMenuViewController()
//        let presenter = MainMenuPresenter(with: viewController, servicesRepository: servicesRepository)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func activityViewableModule() -> UIViewController {
//        let viewController = ActivityViewableViewController()
//        let presenter = ActivityViewablePresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func alertViewableModule() -> UIViewController {
//        let viewController = AlertViewableViewController()
//        let presenter = AlertViewablePresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func alertControllerShowingModule() -> UIViewController {
//        let viewController = AlertControllerShowingViewController()
//        let presenter = AlertControllerShowingPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func textInputsManagerInViewModule() -> UIViewController {
//        let viewController = TextInputsManagerViewController(nibName: "TextInputsManagerViewController", bundle: nil)
//        let presenter = TextInputsManagerPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func textInputsManagerInScrollModule() -> UIViewController {
//        let viewController = TextInputsManagerViewController(nibName: "TextInputsManagerScrollController", bundle: nil)
//        let presenter = TextInputsManagerPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func textInputsModule() -> UIViewController {
//        let viewController = TextInputsViewController()
//        let presenter = TextInputsPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func xibLoadableModule() -> UIViewController {
//        let viewController = XibLoadableViewController()
//        let presenter = XibLoadablePresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func appSettingsModule() -> UIViewController {
//        let viewController = AppSettingsViewController()
//        let presenter = AppSettingsPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func servicePermissionsModule() -> UIViewController {
//        let viewController = ServicePermissionsViewController()
//        let presenter = ServicePermissionsPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func imagePickerModule() -> UIViewController {
//        let viewController = ImagePickerViewController()
//        let presenter = ImagePickerPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func networkModule(servicesRepository: ServicesRepository) -> UIViewController {
//        let viewController = NetworkViewController()
//        let presenter = NetworkPresenter(with: viewController, servicesRepository: servicesRepository)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func modalNavigationModule() -> UIViewController {
//        let viewController = ModalNavigationViewController()
//        let presenter = ModalNavigationPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func imagePreviewingModule() -> UIViewController {
//        let previewItems = TestsDataProvider.imagesForPreview()
//        let initialItemIndex = 2
//        let viewController = ImagePreviewingViewController()
//        let presenter = ImagePreviewingPresenter(with: viewController, previewItems: previewItems, initialItemIndex: initialItemIndex)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func viewAnimationsModule() -> UIViewController {
//        let viewController = ViewAnimationsViewController()
//        let presenter = ViewAnimationsPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func fromModule() -> UIViewController {
//        let viewController = FromViewController()
//        let presenter = FromPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
//
//    static func toModule() -> UIViewController {
//        let viewController = ToViewController()
//        let presenter = ToPresenter(with: viewController)
//        viewController.presenter = presenter
//        return viewController
//    }
    
//}
