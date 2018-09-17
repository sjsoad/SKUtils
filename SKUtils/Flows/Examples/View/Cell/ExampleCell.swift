//
//  ExampleCell.swift
//  SKUtils
//
//  Created by Sergey on 17.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation
import SKDataSources

class ExampleCell: UITableViewCell, ExampleInterface {
    
    var presenter: ExampleOutput?
    
    // MARK: - ExampleInterface -
    
    func set(_ title: String?) {
        textLabel?.subviewId = title
        textLabel?.text = title
    }
    
}

// MARK: - ViewType -

extension ExampleCell: ViewType, Reusable, Nibable {
    
    func set(presenter: PresenterType) {
        self.presenter = presenter as? ExampleOutput
    }
    
}
