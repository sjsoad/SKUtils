//
//  TextInputsViewController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKTextInputsManager
// #1 import module
import SKTextInputs
import SKPickerViewManager

class TextInputsViewController: UIViewController, TextInputsInterface {

    var presenter: TextInputsOutput?

    @IBOutlet private var textInputsManager: TextInputsManager!
    @IBOutlet private var baseTextField: BaseTextField!
    @IBOutlet private var datePickerField: DatePickerField!
    @IBOutlet private var emailField: EmailTextField!
    @IBOutlet private var passwordField: PassTextField!
    @IBOutlet private var pickerViewField: PickerViewField!
    @IBOutlet private var toolbarField: ToolbarTextField!
    @IBOutlet private var toolbarTextView: ToolbarTextView!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setup(datePickerField: datePickerField)
        setup(pickerViewField: pickerViewField)
        setup(toolbarField: toolbarField)
        setup(toolbarTextView: toolbarTextView)
        presenter?.viewDidLoad()
    }

    // MARK: - Private -
    
    private func setup(datePickerField: DatePickerField) {
        // #2.1 ssetup DatePickerField with
        // - setup datePicker if needed
        datePickerField.datePicker.datePickerMode = .date
        // - setup toolbar if needed
        datePickerField.toolbar.tintColor = .black
        // - date selection handler
        datePickerField.dateSelectionHandler = { (field, picker, date) in
            print(field)
            print(picker)
            print(date)
        }
        // - done button title
        datePickerField.doneButtonTitle = "Date Selected"
        // - done button pressed handler
        datePickerField.doneButtonHandler = { (field, button) in
            print(field)
            print(button)
        }
    }
    
    private func setup(pickerViewField: PickerViewField) {
        // #2.2 ssetup PickerViewField with
        // - setup picker if needed
        pickerViewField.picker.showsSelectionIndicator = true
        // - setup toolbar if needed
        pickerViewField.toolbar.barTintColor = .green
        // - done button title
        pickerViewField.doneButtonTitle = "Done"
        // - done button pressed handler
        pickerViewField.doneButtonHandler = { (field, button) in            
            print(field)
            print(button)
        }
    }

    private func setup(toolbarField: ToolbarTextField) {
        // #2.3 ssetup ToolbarTextField with
        // - setup toolbar if needed
        toolbarField.toolbar.barTintColor = .green
        // - done button title
        toolbarField.doneButtonTitle = "Edititng finished"
        // - done button pressed handler
        toolbarField.doneButtonHandler = { (field, button) in
            print(field)
            print(button)
        }
    }
    
    private func setup(toolbarTextView: ToolbarTextView) {
        // #2.4 ssetup ToolbarTextView with
        // - setup toolbar if needed
        toolbarTextView.toolbar.tintColor = .black
        // - done button title
        toolbarTextView.doneButtonTitle = "Edititng finished"
        // - done button pressed handler
        toolbarTextView.doneButtonHandler = { (textView, button) in
            print(textView)
            print(button)
        }
    }
    
    // MARK: - IBActions -
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredResetPickerViewEvent()
    }
    
    // MARK: - TextInputsInterface -
    
    func reload(with manager: PickerManager) {
        pickerViewField.reload(with: manager)
    }
    
    func set(pickerViewText text: String?) {
        pickerViewField.text = text
    }
    
}
