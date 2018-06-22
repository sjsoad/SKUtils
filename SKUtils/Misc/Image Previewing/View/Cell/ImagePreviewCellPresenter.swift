//
//  ImagePreviewCellPresenter.swift
//  SKUtils
//
//  Created by Sergey on 22.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKDataSources

protocol ImagePreviewCellInterface: class {
    
    func set(_ image: UIImage)
    func set(_ imageURL: URL, placeholderImage: UIImage?)
    
}

protocol ImagePreviewOutput {
    
}

class ImagePreviewCellPresenter: DataSourceObjectPresenter {

    private weak var view: ImagePreviewCellInterface?
    
    private(set) var reuseIdentifier: String
    private(set) var model: ImagePreviewItem
    
    init(with objectModel: ImagePreviewItem, cellIdentifier: String) {
        self.model = objectModel
        self.reuseIdentifier = cellIdentifier
    }
    
    // MARK: - DataSourceObjectPresenter -
    
    func set(view: UIView) {
        self.view = view as? ImagePreviewCellInterface
    }
    
    func configure() {
        if let image = model.image {
            view?.set(image)
        } else if let url = model.imageURL {
            view?.set(url, placeholderImage: model.placeholderImage)
        }
    }
    
}

// MARK: - ImagePreviewOutput -

extension ImagePreviewCellPresenter: ImagePreviewOutput {
    
}
