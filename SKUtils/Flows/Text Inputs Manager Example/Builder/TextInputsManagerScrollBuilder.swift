//
//  TextInputsManagerScrollBuilder.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

struct TextInputsManagerScrollBuilder: ModuleBuilder {
    
    func build() -> UIViewController {
        let viewController = TextInputsManagerViewController(nibName: "TextInputsManagerScrollController", bundle: nil)
        let presenter = TextInputsManagerPresenter(with: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
}
