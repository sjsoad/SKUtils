//
//  CustomPresentationBuilder.swift
//  SKUtils
//
//  Created by Sergey on 05.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct CustomPresentationBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        let viewController = ModalNavigationViewController()
        let presenter = ModalNavigationPresenter(with: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
}
