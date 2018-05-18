//
//  TextInputsManagerViewController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKTextInputsManager

class TextInputsManagerViewController: UIViewController, TextInputsManagerInterface {
    
    var presenter: TextInputsManagerOutput?

    @IBOutlet private var textInputsManager: TextInputsManager!
    
//    @IBOutlet weak var pickerViewField: PickerViewField!
//    @IBOutlet weak var datePickerField: DatePickerField!
    
    // MARK: - Lifecycle -
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        pickerViewField.set(doneTitle: "Confirm")
//        datePickerField.set { (_, _, date) in
//            print(date)
//        }
//        datePickerField.set { (_, _) in
//            print("date field done button pressed")
//        }
//        pickerViewField.set { (_, _) in
//            print("picker field done button pressed")
//        }
//        presenter?.viewDidLoad()
//    }

    // MARK: - IBAction -
    
//    @IBAction func resetButtonPressed(_ sender: UIButton) {
//        presenter?.viewTriggeredResetButton()
//    }
    
    // MARK: - TextInputsManagerInterface -
    
//    func set(pickerViewText text: String?) {
//        pickerViewField.text = text
//    }
//    
//    func reload(with manager: PickerManager) {
//        pickerViewField.reload(with: manager)
//    }
    
}
