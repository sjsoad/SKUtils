//
//  TextInputsManagerPresenter.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit
import SKPickerViewManager

protocol TextInputsManagerInterface: class {
    
    func set(pickerViewText text: String?)
    func reload(with manager: PickerManager)
    
}

protocol TextInputsManagerOutput {
    
    func viewDidLoad()
    func viewTriggeredResetButton()
    
}

class TextInputsManagerPresenter: NSObject {
    
    private weak var view: TextInputsManagerInterface?
    
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
        pickerManager.set(selectedIndexes: [IndexPath(row: 2, section: 0)])
        return pickerManager
    }()
    
    init(with view: TextInputsManagerInterface) {
        self.view = view
    }
    
    // MARK: - -
    
    static func showView(in window: UIWindow?) {
        let vc = TextInputsManagerViewController()
        let presenter = TextInputsManagerPresenter(with: vc)
        vc.presenter = presenter
        presenter.show(in: window)
    }
    
    func show(in window: UIWindow?) {
        guard let window = window, let viewController = view as? UIViewController else {
            return
        }
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
}

// MARK: - TextInputsManagerPresenterOutput -

extension TextInputsManagerPresenter: TextInputsManagerOutput {

    func viewDidLoad() {
        view?.reload(with: pickerDataSource)
    }
    
    func viewTriggeredResetButton() {
        pickerDataSource.set(selectedIndexes: [IndexPath(row: 0, section: 0)])
    }
    
}
