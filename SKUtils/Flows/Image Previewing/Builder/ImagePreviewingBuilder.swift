//
//  ImagePreviewingBuilder.swift
//  SKUtils
//
//  Created by Sergey on 17.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import SKImagePreviewing

class ImagePreviewingBuilder: ModuleBuilder {

    func build() -> UIViewController {
        let viewController = ImagePreviewingViewController(nibName: nil, bundle: Bundle(for: ImagePreviewingViewController.self))
        let presenter = ImagePreviewingPresenter(with: viewController, previewItems: TestsDataProvider.imagesForPreview(), initialItemIndex: 0)
        viewController.presenter = presenter
        return viewController
    }
    
}
