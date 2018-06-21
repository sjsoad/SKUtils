//
//  TableViewMoving.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 16.06.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

protocol TableViewMoving {

    func move(cellAt oldIndexPath: IndexPath, to newIndexPath: IndexPath)
    func move(sectionAt oldIndex: Int, to newIndex: Int)
    
}

// MARK: - Interface -

protocol TableViewMovingInterface: TableViewMoving, TableViewing {
    
//    func move(cellAt oldIndexPath: IndexPath, to newIndexPath: IndexPath)
//    func move(sectionAt oldIndex: Int, to newIndex: Int)
    
}

extension TableViewMovingInterface {

    func move(cellAt oldIndexPath: IndexPath, to newIndexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.moveRow(at: oldIndexPath, to: newIndexPath)
        tableView.endUpdates()
    }
    
    func move(sectionAt oldIndex: Int, to newIndex: Int) {
        tableView.beginUpdates()
        tableView.moveSection(oldIndex, toSection: newIndex)
        tableView.endUpdates()
    }
    
}
