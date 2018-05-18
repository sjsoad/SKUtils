//
//  TextInputsManagerPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol TextInputsManagerInterface: class/*, AppSettingsShowingInterface, AlertViewable*/ {
    
//    func set(pickerViewText text: String?)
//    func reload(with manager: PickerManager)
    
}

protocol TextInputsManagerOutput {
//
//    func viewDidLoad()
//    func viewTriggeredResetButton()
    
}

class TextInputsManagerPresenter: NSObject {
    
    private weak var view: TextInputsManagerInterface?
    
//    private lazy var pickerDataSource: PickerManager = { [unowned self] in
//        var components = [PickerComponentObject]()
//        var componentObjects = [PickerRowObject]()
//        for index in 0...10 {
//            let rowObject = PickerRowObject(title: String(describing: index))
//            componentObjects.append(rowObject)
//        }
//        let componentObject = PickerComponentObject(items: componentObjects)
//        components.append(componentObject)
//        let pickerConfigurator = PickerDataSourceConfigurator(components: components)
//        let pickerManager = PickerManager(configuration: pickerConfigurator) { [weak self] (_, component, row) in
//            let text = "C: \(component), R: \(row)"
//            self?.view?.set(pickerViewText: text)
//        }
//        pickerManager.set(selectedIndexes: [IndexPath(row: 2, section: 0)])
//        return pickerManager
//    }()
    
    init(with view: TextInputsManagerInterface) {
        self.view = view
    }
    
    // MARK: - -
    
}

// MARK: - TextInputsManagerPresenterOutput -

extension TextInputsManagerPresenter: TextInputsManagerOutput {

//    func viewDidLoad() {
//        view?.reload(with: pickerDataSource)
//        showAppSettingsAlert()
//    }
//
//    func viewTriggeredResetButton() {
//        pickerDataSource.set(selectedIndexes: [IndexPath(row: 0, section: 0)])
//    }
    
}

//// MARK: - AppSettingsShowingOutput -
//
//extension TextInputsManagerPresenter: AppSettingsShowing {
//
//    var settingsActionTitle: String? { return "Go To Settings" }
//    var cancelActionTitle: String? { return "Cancel" }
//    var settingsAlertTitle: String? { return "Waringng"}
//    var settingsAlertMessage: String? { return "Please check app settings" }
//
//    var appSettingsShowingInterface: AppSettingsShowingInterface? {
//        return view
//    }
//
//}
