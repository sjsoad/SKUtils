//
//  ExampleCellPresenter.swift
//  SKUtils
//
//  Created by Sergey on 17.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKDataSources

protocol ExampleInterface: class {
    
    func set(_ title: String?)
    
}

protocol ExampleOutput {
    
}

class ExampleCellPresenter {
    
    private weak var view: ExampleInterface?
    private(set) var reuseIdentifier: String
    private(set) var model: TitleProvidable
    
    init(with objectModel: TitleProvidable, cellIdentifier: String) {
        self.model = objectModel
        self.reuseIdentifier = cellIdentifier
    }
}

// MARK: - ExampleOutput -

extension ExampleCellPresenter: ExampleOutput {
    
}

// MARK: - PresenterType -

extension ExampleCellPresenter: PresenterType {
    
    func set(view: ViewType) {
        self.view = view as? ExampleInterface
    }
    
    func configure() {
        view?.set(model.title)
    }
}
