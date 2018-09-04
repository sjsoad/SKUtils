//
//  AlertViewableBuilder.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct AlertViewableBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        let viewController = AlertViewableViewController()
        let presenter = AlertViewablePresenter(with: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
}
