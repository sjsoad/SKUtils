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
                Example(title: "Text Inputs Manager Example", type: .inputsManager)]
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
        case .inputsManager:
            let inputsManagerModule = ModuleBuilder.inputsManagerModule()
            interface = inputsManagerModule.interface
        default: print("not implemented case")
        }
        guard let viewController = interface else { return }
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
