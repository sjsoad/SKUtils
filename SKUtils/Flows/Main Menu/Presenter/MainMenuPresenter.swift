//
//  MainMenuPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
import SKDataSources

protocol MainMenuInterface: class, Navigatable {
    
    func set(dataSource: TableViewArrayDataSource)
    
}

protocol MainMenuOutput {
    
    func viewDidLoad()
    func viewTriggeredCellSelection(at indexPath: IndexPath)
    
}

class MainMenuPresenter: NSObject {
    
    private weak var view: MainMenuInterface?
    
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
                Example(title: "Service Permissions Example", type: .servicePermissions)]
    }
    
    private func createDataSource(from list: [Example]) -> TableViewArrayDataSource {
        var items = [DataSourceModel]()
        for item in list {
            let dataSourceModel = MainMenuDataSourceModel(with: item, cellIdentifier: MainMenuCell.reuseIdentifier)
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
        guard let dataSourceModel = dataSource.itemAtIndexPath(indexPath: indexPath) as? MainMenuDataSourceModelDataProviding else { return }
        var interface: UIViewController?
        switch dataSourceModel.type {
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
        case .servicePermissions:
            let servicePermissionsModule = ModuleBuilder.servicePermissionsModule()
            interface = servicePermissionsModule.interface
        default: print("not implemented case")
        }
        guard let viewController = interface else { return }
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
