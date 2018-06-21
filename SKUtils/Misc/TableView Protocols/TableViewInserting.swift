//
//  TableViewInserting.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 16.06.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation
import SKDataSources

// MARK: - Output -

public protocol TableViewInsertingOutput: DataSourceProviding {
    
    var tableViewInsertingInterface: TableViewInsertingInterface? { get set }
    
    func insert(items: [DataSourceObjectPresenter], at indexPath: IndexPath)
    func insert(item: DataSourceObjectPresenter, at indexPath: IndexPath)
    func insert(newSections: [SectionModel], at index: Int)
    func insert(newSection: SectionModel, at index: Int)
    
}

public extension TableViewInsertingOutput where Self: NSObject {
    
    func insert(items: [DataSourceObjectPresenter], at indexPath: IndexPath) {
        dataSource.insert(items: items, at: indexPath) { [weak self] (indexPathes) in
            self?.tableViewInsertingInterface?.insert(cellsAt: indexPathes, with: .automatic)
        }
    }
    
    func insert(item: DataSourceObjectPresenter, at indexPath: IndexPath) {
        dataSource.insert(item: item, at: indexPath) { [weak self] (indexPathes) in
            self?.tableViewInsertingInterface?.insert(cellsAt: indexPathes, with: .automatic)
        }
    }
    
    func insert(newSections: [SectionModel], at index: Int) {
        dataSource.insert(newSections: newSections, at: index) { [weak self] (indexes) in
            self?.tableViewInsertingInterface?.insert(sectionsAt: indexes, with: .automatic)
        }
    }
    
    func insert(newSection: SectionModel, at index: Int) {
        dataSource.insert(newSection: newSection, at: index) { [weak self] (indexes) in
            self?.tableViewInsertingInterface?.insert(sectionsAt: indexes, with: .automatic)
        }
    }
    
}

// MARK: - Interface -

public protocol TableViewInsertingInterface: TableViewing {
    
    func insert(cellsAt indexPathes: [IndexPath], with animation: UITableViewRowAnimation)
    func insert(sectionsAt indexes: IndexSet, with animation: UITableViewRowAnimation)
    
}

public extension TableViewInsertingInterface {

    func insert(cellsAt indexPathes: [IndexPath], with animation: UITableViewRowAnimation = .automatic) {
        tableView.beginUpdates()
        tableView.insertRows(at: indexPathes, with: animation)
        tableView.endUpdates()
    }
    
    func insert(sectionsAt indexes: IndexSet, with animation: UITableViewRowAnimation = .automatic) {
        tableView.beginUpdates()
        tableView.insertSections(indexes, with: animation)
        tableView.endUpdates()
    }
    
}
