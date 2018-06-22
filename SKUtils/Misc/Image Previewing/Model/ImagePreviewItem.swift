//
//  ImagePreviewItem.swift
//  SKUtils
//
//  Created by Sergey on 22.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class ImagePreviewItem: NSObject {

    var image: UIImage?
    var placeholderImage: UIImage?
    var imageURL: URL?
    
    init(image: UIImage?) {
        self.image = image
    }
    
    init(imageURL: URL?, placeholderImage: UIImage? = nil) {
        self.imageURL = imageURL
        self.placeholderImage = placeholderImage
    }
    
}
