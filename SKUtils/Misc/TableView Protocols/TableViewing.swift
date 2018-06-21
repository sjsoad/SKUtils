//
//  TableViewing.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 16.06.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation
import SKDataSources

// MARK: - Interface -

public protocol TableViewing {

    var tableView: UITableView { get set }
    func setup(_ tableView: UITableView)
    
}
