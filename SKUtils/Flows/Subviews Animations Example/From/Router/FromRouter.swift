//
//  FromRouter.swift
//  SKUtils
//
//  Created by Sergey on 11.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

protocol FromRoutable {
    
    func showToExample()
    
}

struct FromRouter: FromRoutable {

    private weak var viewController: UIViewController?
    
    init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showToExample() {
        viewController?.navigationController?.pushViewController(ToModuleBuilder.build(), animated: true)
    }
    
}
