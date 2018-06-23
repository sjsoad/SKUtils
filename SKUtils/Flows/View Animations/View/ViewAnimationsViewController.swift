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
        sender.animate(with: [TransformAnimationProvider(fromTransfrom: .identity, toTransform: CGAffineTransform(scaleX: 1, y: -1)),
                              AlphaAnimationProvider(fromAlpha: 1, toAlpha: 0.5)], reverse: false)
    }
    
    // MARK: - ViewAnimationsInterface -
    
}
