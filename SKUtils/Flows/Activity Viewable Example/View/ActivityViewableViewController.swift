//
//  ActivityViewableViewController.swift
//  SKUtils
//
//  Created by Sergey on 18.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class ActivityViewableViewController: UIViewController, ActivityViewableInterface {

    var presenter: ActivityViewableOutput?

    // MARK: - IBActions -
    
    @IBAction func showActivityButtonPresed(_ sender: UIButton) {
        presenter?.viewTriggeredShowActivityEvent()
    }
    
    // MARK: - ActivityViewableInterface -
    
}
