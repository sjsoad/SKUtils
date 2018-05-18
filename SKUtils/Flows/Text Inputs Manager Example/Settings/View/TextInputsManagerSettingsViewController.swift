//
//  TextInputsManagerViewController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 25.04.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKTextInputsManager

class TextInputsManagerSettingsViewController: UIViewController, TextInputsManagerSettingsInterface {
    
    var presenter: TextInputsManagerSettingsOutput?

    @IBOutlet private weak var hideOnTapSwitch: UISwitch!
    @IBOutlet private weak var activateNextFieldSwitch: UISwitch!
    @IBOutlet private weak var assignReturnKeySwitch: UISwitch!
    @IBOutlet private weak var stepperValueLabel: UILabel!
    @IBOutlet private weak var stepper: UIStepper!
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    
    // MARK: - IBActions -
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValueLabel.text = "\(sender.value)"
    }
    
    @IBAction func showExampleButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredShowExampleEvent()
    }
    
    // MARK: - TextInputsManagerSettingsInterface  -
    
    var hideOnTap: Bool { return hideOnTapSwitch.isOn }
    
    var nextBecomesFirstResponder: Bool { return activateNextFieldSwitch.isOn }
    
    var handleReturnKey: Bool { return assignReturnKeySwitch.isOn }
    
    var additionalSpace: Double { return stepper.value }
    
    var exampleType: ExampleType { return ExampleType(rawValue: segmentControl.selectedSegmentIndex) ?? .view }
    
}
