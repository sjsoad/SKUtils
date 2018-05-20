//
//  AppSettingsViewController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 20.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class AppSettingsViewController: UIViewController, AppSettingsInterface {

    var presenter: AppSettingsOutput?

    // MARK: - IBActions -

    @IBAction func showSettingsButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredShowSettingsEvent()
    }
    
    // MARK: - AppSettingsInterface -
    
}
