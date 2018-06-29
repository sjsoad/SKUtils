//
//  MainMenuPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

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
                Example(title: "View Animations Example", type: .viewAnimations)]
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

// MARK: - MainMenuPresenterOutput -

extension MainMenuPresenter: MainMenuOutput {

    func viewDidLoad() {
        view?.set(dataSource: dataSource)
    }
    
    func viewTriggeredCellSelection(at indexPath: IndexPath) {
        guard let dataSourceObjectPresenter: MainMenuCellPresenter = dataSource.itemAtIndexPath(indexPath: indexPath) else { return }
        var interface: UIViewController?
        switch dataSourceObjectPresenter.model.type {
        case .activityViewable:
            let activityViewableModule = ModuleBuilder.activityViewableModule()
            interface = activityViewableModule.interface
        case .alertViewable:
            let alertViewableModule = ModuleBuilder.alertViewableModule()
            interface = alertViewableModule.interface
        case .alertControllerShowing:
            let alertControllerModule = ModuleBuilder.alertControllerShowingModule()
            interface = alertControllerModule.interface
        case .inputsManagerInView:
            let inputsManagerModule = ModuleBuilder.textInputsManagerInViewModule()
            interface = inputsManagerModule.interface
        case .inputsManagerInScroll:
            let inputsManagerModule = ModuleBuilder.textInputsManagerInScrollModule()
            interface = inputsManagerModule.interface
        case .textInputs:
            let textInputsModule = ModuleBuilder.textInputsModule()
            interface = textInputsModule.interface
        case .xibLoadable:
            let xibLoadableModule = ModuleBuilder.xibLoadableModule()
            interface = xibLoadableModule.interface
        case .appSettings:
            let appSettingsModule = ModuleBuilder.appSettingsModule()
            interface = appSettingsModule.interface
        case .imagePicking:
            let imagePickerModule = ModuleBuilder.imagePickerModule()
            interface = imagePickerModule.interface
        case .servicePermissions:
            let servicePermissionsModule = ModuleBuilder.servicePermissionsModule()
            interface = servicePermissionsModule.interface
        case .networking:
            let networkModule = ModuleBuilder.networkModule(servicesRepository: servicesRepository)
            interface = networkModule.interface
        case .modalTransition:
            let modalNavigationModule = ModuleBuilder.modalNavigationModule()
            guard let viewController = view as? UIViewController else { return }
            modalNavigationModule.interface.transitioningDelegate = transitioningDelegate
            transitioningDelegate.interactionController = PanInteractionController(viewController: modalNavigationModule.interface)
            viewController.present(modalNavigationModule.interface, animated: true, completion: nil)
            return
        case .customPresentation:
            let modalNavigationModule = ModuleBuilder.modalNavigationModule()
            guard let viewController = view as? UIViewController else { return }
            customTransitioningDelegate.interactionController = PanInteractionController(viewController: modalNavigationModule.interface)
            modalNavigationModule.interface.transitioningDelegate = customTransitioningDelegate
            modalNavigationModule.interface.modalPresentationStyle = .custom
            viewController.present(modalNavigationModule.interface, animated: true, completion: nil)
            return
        case .imagePreviewing:
            let imagePreviewingModule = ModuleBuilder.imagePreviewingModule()
            interface = imagePreviewingModule.interface
        case .viewAnimations:
            let viewAnimationsModule = ModuleBuilder.viewAnimationsModule()
            interface = viewAnimationsModule.interface
        default: print("not implemented case")
        }
        guard let viewController = interface else { return }
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
