//
//  DataSourceProviding.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 16.06.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation
import SKDataSources

// MARK: - Output -

public protocol DataSourceProviding {
    
    var dataSource: ArrayDataSourceRepresentable { get set }
    
}
