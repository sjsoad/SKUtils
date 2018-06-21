//
//  ModalNavigationViewController.swift
//  SKUtils
//
//  Created by Sergey on 07.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKTextInputsManager

class ModalNavigationViewController: UIViewController, ModalNavigationInterface {

    var presenter: ModalNavigationOutput?
    
    @IBOutlet private var textInputsManager: TextInputsManager!
    
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.text = "asdfasf\nasdfsadfasfd\nsdfasdfasfdasdfasfa\nasdfasfdasdfasdf\n"
        self.presentationController?.containerView?.setNeedsLayout()
    }
    
    // MARK: - IBActions -
    
    @IBAction func dismissButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredDismissEvent()
    }
    
    // MARK: - ModalNavigationInterface -
    
}
