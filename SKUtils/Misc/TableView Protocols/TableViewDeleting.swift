//
//  TableViewDeleting.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 16.06.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

protocol TableViewDeleting {

    func delete(cellsAt indexPathes: [IndexPath], with animation: UITableViewRowAnimation)
    func delete(sectionsAt indexes: IndexSet, with animation: UITableViewRowAnimation)
}

// MARK: - Interface -

protocol TableViewDeletingInterface: TableViewDeleting, TableViewing {
    
    func delete(cellsAt indexPathes: [IndexPath], with animation: UITableViewRowAnimation)
    func delete(sectionsAt indexes: IndexSet, with animation: UITableViewRowAnimation)
}

extension TableViewDeletingInterface {

    func delete(cellsAt indexPathes: [IndexPath], with animation: UITableViewRowAnimation = .automatic) {
        tableView.beginUpdates()
        tableView.deleteRows(at: indexPathes, with: animation)
        tableView.endUpdates()
    }
    
    func delete(sectionsAt indexes: IndexSet, with animation: UITableViewRowAnimation = .automatic) {
        tableView.beginUpdates()
        tableView.deleteSections(indexes, with: animation)
        tableView.endUpdates()
    }
    
}
