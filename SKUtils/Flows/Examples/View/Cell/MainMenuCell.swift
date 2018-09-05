//
//  MainMenuCell.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//
// use APIClient for executing this requests

import UIKit
import Foundation
import SKDataSources

class MainMenuCell: UITableViewCell, DataSourceObjectInterface, Reusable, Nibable, MainMenuCellInterface {
    
    var presenter: MainMenuCellOutput?
    
    // MARK: - DataSourceObjectInterface -
    
    func set(presenter: DataSourceObjectPresenter) {
        self.presenter = presenter as? MainMenuCellOutput
    }
    
    // MARK: - MainMenuCellInterface -
    
    func set(_ title: String?) {
        textLabel?.subviewId = title
        textLabel?.text = title
    }
    
}
