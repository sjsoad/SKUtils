//
//  ViewAnimationsViewController.swift
//  SKUtils
//
//  Created by Sergey on 23.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

class ViewAnimationsViewController: UIViewController, ViewAnimationsInterface {

    var presenter: ViewAnimationsOutput?

    @IBOutlet private weak var testView: UIView!
    @IBOutlet private weak var button: UIButton!
    
    // MARK: - Lifecycle -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        button.move(from: CGPoint(x: view.bounds.width, y: 0), delay: 0.5)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        button.move(to: CGPoint(x: view.bounds.width, y: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions -
    
    @IBAction func rippleEffectButtonPressed(_ sender: UIButton) {

    }
    
    // MARK: - ViewAnimationsInterface -
    
}
