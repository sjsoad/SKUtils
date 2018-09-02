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

// #2 add support of PickerViewFieldReloading for PickerViewField reloading if you have on pickerViewField
protocol TextInputsInterface: class, PickerViewFieldReloadable {
    
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
        var components = [PickerComponent]()
        var componentObjects = [PickerRow]()
        for index in 0...10 {
            let rowObject = PickerRowObject(title: String(describing: index))
            componentObjects.append(rowObject)
        }
        let componentObject = PickerComponentObject(items: componentObjects)
        components.append(componentObject)
        let pickerConfigurator = PickerDataSourceConfigurator(components: components)
        let pickerManager = DefaultPickerManager(configuration: pickerConfigurator) { [weak self] (_, component, row) in
            let text = "C: \(component), R: \(row)"
            self?.view?.set(pickerViewText: text)
        }
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
        // #5 select components if needed
        view?.select(2, inComponent: 0)
        print(pickerDataSource.selectedIndexes)
    }
    
    func viewTriggeredResetPickerViewEvent() {
        view?.set(pickerViewText: nil)
        view?.select(0, inComponent: 0)
        print(pickerDataSource.selectedIndexes)
    }
    
}
