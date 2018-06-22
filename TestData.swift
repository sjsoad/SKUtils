//
//  TestData.swift
//  SKUtils
//
//  Created by Sergey on 22.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

class TestsDataProvider {
    
    class func imagesForPreview() -> [ImagePreviewItem] {
        let testImage = UIImage(named: "test image")
        let firstLink = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiUk8V76AvsGFAkDEHVjnZID8iFgB8LF7mQMbVVDB8mLnxb81v1g"
        let secondLink = "https://images.pexels.com/photos/236047/pexels-photo-236047.jpeg?auto=compress&cs=tinysrgb&h=350"
        let thirdLink = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8NMJ5v46BIl5uZN2d-Mjmr9NWAWY4Ji07P-fLip0syFuwZz0x"
        return [ImagePreviewItem(image: testImage),
                ImagePreviewItem(imageURL: URL(string: firstLink)),
                ImagePreviewItem(imageURL: URL(string: secondLink)),
                ImagePreviewItem(imageURL: URL(string: thirdLink))]
    }
    
}
