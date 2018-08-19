//
//  MainMenuPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

// disable some swiftlint rules for this file

// swiftlint:disable cyclomatic_complexity

import Foundation
import SKDataSources
import SKCustomNavigation

protocol MainMenuInterface: class, Navigatable {
    
    func set(dataSource: TableViewArrayDataSource)
    
}

protocol MainMenuOutput {
    
    func viewDidLoad()
    func viewTriggeredCellSelection(at indexPath: IndexPath)
    
}

class MainMenuPresenter: NSObject {
    
    private weak var view: MainMenuInterface?
    private var transitioningDelegate: DefaultTransitioningDelegate = {
        return DefaultTransitioningDelegate(animatedTransitioning: Page(transitionDirection: .fromLeft))
    }()
    private var customTransitioningDelegate: DefaultTransitioningDelegate = {
        return DefaultTransitioningDelegate(animatedTransitioning: ZoomSlide(transitionDirection: .fromBottom),
                                            presentationControllerProvider: { (presented, presenting, _) -> UIPresentationController? in
            let presentationController = DefaultPresentationController(presentedViewController: presented, presenting: presenting)
                                                presentationController.position = Position(x: .center, y: .center)
                                                return presentationController
        })
    }()
    private var servicesRepository: ServicesRepository
    private lazy var dataSource: TableViewArrayDataSource = { [unowned self] in
        return createDataSource(from: examples)
    }()
    
    init(with view: MainMenuInterface, servicesRepository: ServicesRepository) {
        self.view = view
        self.servicesRepository = servicesRepository
    }
    
    // MARK: - Private -
    
    private var examples: [Example] {
        return [Example(title: "Activity Viewable Example", type: .activityViewable),
                Example(title: "Alert Viewable Example", type: .alertViewable),
                Example(title: "Alert Controller Showing Example", type: .alertControllerShowing),
                Example(title: "Text Inputs Manager View Example", type: .inputsManagerInView),
                Example(title: "Text Inputs Manager Scroll Example", type: .inputsManagerInScroll),
                Example(title: "Text Inputs + Picker View Manager Example", type: .textInputs),
                Example(title: "Xib Loadable Example", type: .xibLoadable),
                Example(title: "App Settings Example", type: .appSettings),
                Example(title: "Image Picking Example", type: .imagePicking),
                Example(title: "Service Permissions Example", type: .servicePermissions),
                Example(title: "Network Example", type: .networking),
                Example(title: "Custom Modal Transition Example", type: .modalTransition),
                Example(title: "Custom Presentation Example", type: .customPresentation),
                Example(title: "Image Previewing Example", type: .imagePreviewing),
                Example(title: "View Animations Example", type: .viewAnimations),
                Example(title: "Subviews Animations Example", type: .subviewsAnimations)]
    }
    
    private func createDataSource(from list: [Example]) -> TableViewArrayDataSource {
        var items = [DataSourceObjectPresenter]()
        for item in list {
            let dataSourceModel = MainMenuCellPresenter(with: item, cellIdentifier: MainMenuCell.reuseIdentifier)
            items.append(dataSourceModel)
        }
        let section = SectionModel(withItems: items)
        return TableViewArrayDataSource(with: [section])
    }
    
}

// MARK: - MainMenuOutput -

extension MainMenuPresenter: MainMenuOutput {

    func viewDidLoad() {
        view?.set(dataSource: dataSource)
    }
    
    func viewTriggeredCellSelection(at indexPath: IndexPath) {
        guard let dataSourceObjectPresenter: MainMenuCellPresenter = dataSource.itemAtIndexPath(indexPath: indexPath) else { return }
        var interface: UIViewController?
        switch dataSourceObjectPresenter.model.type {
        case .activityViewable:
            let activityViewableVC = ModuleBuilder.activityViewableModule()
            interface = activityViewableVC
        case .alertViewable:
            let alertViewableVC = ModuleBuilder.alertViewableModule()
            interface = alertViewableVC
        case .alertControllerShowing:
            let alertControllerVC = ModuleBuilder.alertControllerShowingModule()
            interface = alertControllerVC
        case .inputsManagerInView:
            let inputsManagerVC = ModuleBuilder.textInputsManagerInViewModule()
            interface = inputsManagerVC
        case .inputsManagerInScroll:
            let inputsManagerVC = ModuleBuilder.textInputsManagerInScrollModule()
            interface = inputsManagerVC
        case .textInputs:
            let textInputsVC = ModuleBuilder.textInputsModule()
            interface = textInputsVC
        case .xibLoadable:
            let xibLoadableVC = ModuleBuilder.xibLoadableModule()
            interface = xibLoadableVC
        case .appSettings:
            let appSettingsVC = ModuleBuilder.appSettingsModule()
            interface = appSettingsVC
        case .imagePicking:
            let imagePickerVC = ModuleBuilder.imagePickerModule()
            interface = imagePickerVC
        case .servicePermissions:
            let servicePermissionsVC = ModuleBuilder.servicePermissionsModule()
            interface = servicePermissionsVC
        case .networking:
            let networkVC = ModuleBuilder.networkModule(servicesRepository: servicesRepository)
            interface = networkVC
        case .modalTransition:
            let modalNavigationVC = ModuleBuilder.modalNavigationModule()
            guard let viewController = view as? UIViewController else { return }
//            modalNavigationModule.interface.transitioningDelegate = transitioningDelegate
//            transitioningDelegate.interactionController = PanForDismiss(viewController: modalNavigationModule.interface)
            viewController.present(modalNavigationVC, animated: true, completion: nil)
            return
        case .customPresentation:
            let modalNavigationVC = ModuleBuilder.modalNavigationModule()
            guard let viewController = view as? UIViewController else { return }
//            customTransitioningDelegate.interactionController = PanForDismiss(viewController: modalNavigationModule.interface)
//            modalNavigationModule.interface.transitioningDelegate = customTransitioningDelegate
//            modalNavigationModule.interface.modalPresentationStyle = .custom
            viewController.present(modalNavigationVC, animated: true, completion: nil)
            return
        case .imagePreviewing:
            let imagePreviewingVC = ModuleBuilder.imagePreviewingModule()
            interface = imagePreviewingVC
        case .viewAnimations:
            let viewAnimationsVC = ModuleBuilder.viewAnimationsModule()
            interface = viewAnimationsVC
        case .subviewsAnimations:
            let fromVC = ModuleBuilder.fromModule()
            interface = fromVC
        default: print("not implemented case")
        }
        guard let viewController = interface else { return }
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

// enable swiftlint rules disabled for this file

// swiftlint:enable cyclomatic_complexity
