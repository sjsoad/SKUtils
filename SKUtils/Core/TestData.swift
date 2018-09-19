//
//  TestData.swift
//  SKUtils
//
//  Created by Sergey on 22.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import SKImagePreviewing

class TestsDataProvider {
    
    class func imagesForPreview() -> [ImagePreviewRepresentable] {
        let testImage = UIImage(named: "test image")
        let firstLink = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiUk8V76AvsGFAkDEHVjnZID8iFgB8LF7mQMbVVDB8mLnxb81v1g"
        let secondLink = "https://images.pexels.com/photos/236047/pexels-photo-236047.jpeg?auto=compress&cs=tinysrgb&h=350"
        let thirdLink = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8NMJ5v46BIl5uZN2d-Mjmr9NWAWY4Ji07P-fLip0syFuwZz0x"
        return [ImagePreviewItem(image: testImage),
                ImagePreviewItem(imageURL: URL(string: firstLink)),
                ImagePreviewItem(imageURL: URL(string: secondLink)),
                ImagePreviewItem(imageURL: URL(string: thirdLink))]
    }
    
    class func examples() -> [[Example]] {
        return [[Example(title: "Activity Viewable Example", builder: ActivityViewableModuleBuilder()),
                Example(title: "Alert Viewable Example", builder: AlertViewableBuilder()),
                Example(title: "Alert Controller Showing Example", builder: AlertControllerShowingBuilder()),
                Example(title: "Text Inputs Manager View Example", builder: TextInputsManagerViewBuilder()),
                Example(title: "Text Inputs Manager Scroll Example", builder: TextInputsManagerScrollBuilder()),
                Example(title: "Text Inputs + Picker View Manager Example", builder: TextInputsBuilder()),
                Example(title: "App Settings Example", builder: AppSettingsBuilder()),
                Example(title: "Image Picking Example", builder: ImagePickerBuilder()),
                Example(title: "Service Permissions Example", builder: ServicePermissionsBuilder()),
                Example(title: "Network Example", builder: NetworkBuilder()),
                /*Example(title: "Subviews Animations Example", builder: FromModuleBuilder()),*/
                Example(title: "Image Previewing Example", builder: ImagePreviewingBuilder())],
                [Example(title: "Custom Modal Transition Example", builder: ModalNavigationBuilder())/*,
                Example(title: "Custom Presentation Example", builder: CustomPresentationBuilder())*/]]
                /*Example(title: "View Animations Example", type: .viewAnimations)*/
    }
    
}
