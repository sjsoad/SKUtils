//
//  ExamplesPresenter.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKDataSources

protocol ExamplesInterface: class {
    
    func set(dataSource: TableViewArrayDataSource)
    
}

protocol ExamplesOutput: ViewLifecycleOutput {
    
    func viewTriggeredCellSelection(at indexPath: IndexPath)
    
}

class ExamplesPresenter: NSObject {
    
    private weak var view: ExamplesInterface?
    
    private var router: ExamplesRoutable
    
    private var examples: [TitleProvidable]
    
    private lazy var dataSource: TableViewArrayDataSource = { [unowned self] in
        return createDataSource(from: examples)
    }()
    
    init(with view: ExamplesInterface, router: ExamplesRoutable, examples: [TitleProvidable]) {
        self.view = view
        self.router = router
        self.examples = examples
    }
    
    // MARK: - Private -
    
    private func createDataSource(from list: [TitleProvidable]) -> TableViewArrayDataSource {
        let items: [DataSourceObjectPresenter] = list.map({ MainMenuCellPresenter(with: $0, cellIdentifier: MainMenuCell.reuseIdentifier) })
        let section = SectionModel(withItems: items)
        return TableViewArrayDataSource(with: [section])
    }
    
}

// MARK: - ExamplesOutput -

extension ExamplesPresenter: ExamplesOutput {
    
    func viewDidLoad() {
        view?.set(dataSource: dataSource)
    }
    
    func viewTriggeredCellSelection(at indexPath: IndexPath) {
        router.pushModule(at: indexPath)
    }
    
}
