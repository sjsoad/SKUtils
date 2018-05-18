//
//  MainMenuDataSourceModel.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation
import SKDataSources

// Transform DataSourceModel in cell to this protocol to receive ui data
protocol MainMenuDataSourceModelDisplaying {
    
    var title: String { get }
    
}

// Transform DataSourceModel in presenter to this protocol to receive data
protocol MainMenuDataSourceModelDataProviding {
    
    var type: ModuleType { get }
    
}

class MainMenuDataSourceModel: DataSourceModel {
    
    private(set) var reuseIdentifier: String
    private let model: Example
    
    init(with objectModel: Example, cellIdentifier: String) {
        self.model = objectModel
        self.reuseIdentifier = cellIdentifier
    }
    
}

// MARK: - MainMenuDataSourceModelDisplaying -

extension MainMenuDataSourceModel: MainMenuDataSourceModelDisplaying {
    
    var title: String { return model.title }
    
}

// MARK: - MainMenuDataSourceModelDataProviding -

extension MainMenuDataSourceModel: MainMenuDataSourceModelDataProviding {
    
    var type: ModuleType { return model.type }
    
}
