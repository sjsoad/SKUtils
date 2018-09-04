//
//  Popable.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol Popable {

    func popViewController(animated: Bool)
}

struct DefaultPopRouter: Popable {
    
    private weak var viewController: UIViewController?
    
    init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func popViewController(animated: Bool) {
        viewController?.navigationController?.popViewController(animated: animated)
    }
    
}
