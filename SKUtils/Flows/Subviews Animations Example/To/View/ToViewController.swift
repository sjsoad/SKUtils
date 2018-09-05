//
//  ToViewController.swift
//  SKUtils
//
//  Created by Sergey on 11.07.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

class ToViewController: UIViewController, ToInterface {

    var presenter: ToOutput?

    @IBOutlet private weak var pictureView: UIImageView!
    @IBOutlet private weak var backButton: UIButton!
    
    // MARK: - Lifecycle -
    
    // MARK: - IBActions -
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredBackEvent()
    }
    
    // MARK: - ToInterface -
    
}
