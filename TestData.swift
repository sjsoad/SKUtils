//
//  TestData.swift
//  SKUtils
//
//  Created by Sergey on 22.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
import SKImagePreviewing
import SKDataSources

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
    
    class func examples() -> [Example] {
        return [Example(title: "Activity Viewable Example", builder: ActivityViewableModuleBuilder()),
                Example(title: "Alert Viewable Example", builder: AlertViewableBuilder())/*,
                Example(title: "Alert Controller Showing Example", type: .alertControllerShowing),
                Example(title: "Text Inputs Manager View Example", type: .inputsManagerInView),
                Example(title: "Text Inputs Manager Scroll Example", type: .inputsManagerInScroll),
                Example(title: "Text Inputs + Picker View Manager Example", type: .textInputs),
                Example(title: "Xib Loadable Example", type: .xibLoadable),
                Example(title: "App Settings Example", type: .appSettings),
                Example(title: "Image Picking Example", type: .imagePicking),
                Example(title: "Service Permissions Example", type: .servicePermissions),
                Example(title: "Network Example", type: .networking),
                Example(title: "Custom Modal Transition Example", type: .modalTransition),
                Example(title: "Custom Presentation Example", type: .customPresentation),
                Example(title: "Image Previewing Example", type: .imagePreviewing),
                Example(title: "View Animations Example", type: .viewAnimations),
                Example(title: "Subviews Animations Example", type: .subviewsAnimations)*/]
    }
    
}
