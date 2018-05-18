//
//  AlertViewableViewController.swift
//  SKUtils
//
//  Created by Sergey on 18.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class AlertViewableViewController: UIViewController, AlertViewableInterface {

    var presenter: AlertViewableOutput?
    
    // MARK: - IBActions -

    @IBAction func showAlertButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggredShowAlertEvent()
    }
    
    // MARK: - AlertViewableInterface -
    
}
