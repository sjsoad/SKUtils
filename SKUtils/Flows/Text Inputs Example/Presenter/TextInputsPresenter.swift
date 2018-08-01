//
//  TextInputsPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
// #1 import Module
import SKTextInputs
import SKPickerViewManager

// #2 add support of PickerViewFieldReloading for PickerViewField reloading
protocol TextInputsInterface: class, PickerViewFieldReloading {
    
    func set(pickerViewText text: String?)
    
}

protocol TextInputsOutput {
 
    func viewDidLoad()
    func viewTriggeredResetPickerViewEvent()
    
}

class TextInputsPresenter: NSObject {
    
    private weak var view: TextInputsInterface?
    
    // #3 setup PickerManager
    private lazy var pickerDataSource: PickerManager = { [unowned self] in
        var components = [PickerComponentObject]()
        var componentObjects = [PickerRowObject]()
        for index in 0...10 {
            let rowObject = PickerRowObject(title: String(describing: index))
            componentObjects.append(rowObject)
        }
        let componentObject = PickerComponentObject(items: componentObjects)
        components.append(componentObject)
        let pickerConfigurator = PickerDataSourceConfigurator(components: components)
        let pickerManager = PickerManager(configuration: pickerConfigurator) { [weak self] (_, component, row) in
            let text = "C: \(component), R: \(row)"
            self?.view?.set(pickerViewText: text)
        }
        // set selected values if needed
        pickerManager.set(selectedIndexes: [IndexPath(row: 2, section: 0)])
        return pickerManager
        }()
    
    init(with view: TextInputsInterface) {
        self.view = view
    }
    
}

// MARK: - TextInputsOutput -

extension TextInputsPresenter: TextInputsOutput {

    func viewDidLoad() {
        // #4 assign PickerManager to PickerViewField
        view?.reload(with: pickerDataSource)
    }
    
    func viewTriggeredResetPickerViewEvent() {
        // #5 reset selected values
        pickerDataSource.set(selectedIndexes: [])
        view?.set(pickerViewText: nil)
        // or
        // set default value
//        pickerDataSource.set(selectedIndexes: [IndexPath(row: 0, section: 0)])
    }
    
}
