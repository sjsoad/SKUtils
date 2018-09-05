//
//  NetworkBuilder.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct NetworkBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        let viewController = NetworkViewController()
        let presenter = NetworkPresenter(with: viewController, ipDetectingService: DefaultServiceRepository.shared.ipDetectingService())
        viewController.presenter = presenter
        return viewController
    }
    
}
