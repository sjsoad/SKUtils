//
//  ModalNavigationViewController.swift
//  SKUtils
//
//  Created by Sergey on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class ModalNavigationViewController: UIViewController, ModalNavigationInterface {

    var presenter: ModalNavigationOutput?
    
    // MARK: - IBActions -
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredDismissEvent()
    }
    
    // MARK: - ModalNavigationInterface -
    
}
