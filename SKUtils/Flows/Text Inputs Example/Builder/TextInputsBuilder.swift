//
//  TextInputsBuilder.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct TextInputsBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        let viewController = TextInputsViewController()
        let presenter = TextInputsPresenter(with: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
}
