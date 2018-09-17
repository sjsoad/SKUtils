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
    
    func set(dataSource: TableViewArrayDataSourceRepresentable)
    
}

protocol ExamplesOutput: ViewLifecycleOutput {
    
    func viewTriggeredCellSelection(at indexPath: IndexPath)
    
}

class ExamplesPresenter: NSObject {
    
    private weak var view: ExamplesInterface?
    
    private var router: ExamplesRoutable
    private var examples: [[TitleProvidable]]
    private lazy var dataSource: TableViewArrayDataSourceRepresentable = { [unowned self] in
        return createDataSource(from: examples)
    }()
    
    init(with view: ExamplesInterface, _ router: ExamplesRoutable, _ examples: [[TitleProvidable]]) {
        self.view = view
        self.router = router
        self.examples = examples
    }
    
    // MARK: - Private -
    
    private func createDataSource(from list: [[TitleProvidable]]) -> TableViewArrayDataSourceRepresentable {
        let sections = list.map({ DefaultSection(with: $0.map({ ExampleCellPresenter(with: $0,
                                                                                     cellIdentifier: ExampleCell.reuseIdentifier) })) })
        return TableViewArrayDataSource(with: sections)
    }

}

// MARK: - ExamplesOutput -

extension ExamplesPresenter: ExamplesOutput {
    
    func viewDidLoad() {
        view?.set(dataSource: dataSource)
    }
    
    func viewTriggeredCellSelection(at indexPath: IndexPath) {
        router.showExample(at: indexPath)
    }
    
}
