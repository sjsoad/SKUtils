//
//  ViewAnimationsViewController.swift
//  SKUtils
//
//  Created by Sergey on 23.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class ViewAnimationsViewController: UIViewController, ViewAnimationsInterface {

    var presenter: ViewAnimationsOutput?

    // MARK: - Lifecycle -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions -
    
    @IBAction func rippleEffectButtonPressed(_ sender: UIButton) {
        sender.touchAnimation()
    }
    
    // MARK: - ViewAnimationsInterface -
    
}
