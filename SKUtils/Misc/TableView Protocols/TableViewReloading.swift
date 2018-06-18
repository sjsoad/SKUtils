//
//  TableViewReloading.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 16.06.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation
import SKDataSources

protocol TableViewReloading {

    func reload(with dataSource: TableViewArrayDataSource)
    func reload()
    func reload(cellsAt indexPathes: [IndexPath], with animation: UITableViewRowAnimation)
    
}

// MARK: - Interface -

protocol TableViewReloadingInterface: TableViewReloading, TableViewing {
    
}

extension TableViewReloadingInterface {

    func reload(with dataSource: TableViewArrayDataSource) {
        tableView.dataSource = dataSource
        reload()
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    func reload(cellsAt indexPathes: [IndexPath], with animation: UITableViewRowAnimation = .automatic) {
        tableView.reloadRows(at: indexPathes, with: animation)
    }
    
}
