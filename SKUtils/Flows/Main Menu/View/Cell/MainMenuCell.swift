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

class MainMenuCell: UITableViewCell, ConfigurableCell {
        
    func configure<T>(viewModel: T) {
        guard let viewModel = viewModel as? MainMenuDataSourceModelDisplaying else { return }
        textLabel?.text = viewModel.title
    }
    
}
