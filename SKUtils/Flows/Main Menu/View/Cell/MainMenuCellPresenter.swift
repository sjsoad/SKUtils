//
//  MainMenuCellPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKDataSources

protocol MainMenuCellInterface: class {
    
    func set(_ title: String?)
    
}

protocol MainMenuCellOutput {
    
}

class MainMenuCellPresenter: DataSourceObjectPresenter {
    
    private weak var view: MainMenuCellInterface?
    
    private(set) var reuseIdentifier: String
    private(set) var model: Example
    
    init(with objectModel: Example, cellIdentifier: String) {
        self.model = objectModel
        self.reuseIdentifier = cellIdentifier
    }
    
    // MARK: - DataSourceObjectPresenter -
    
    func set(view: UIView) {
        self.view = view as? MainMenuCellInterface
    }
    
    func configure() {
        view?.set(model.title)
    }
    
}

// MARK: - MainMenuCellOutput -

extension MainMenuCellPresenter: MainMenuCellOutput {
    
}
