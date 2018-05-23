//
//  NetworkViewController.swift
//  SKUtils
//
//  Created by Sergey on 23.05.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit

class NetworkViewController: UIViewController, NetworkInterface {

    var presenter: NetworkOutput?

    @IBOutlet private weak var ipAddressLabel: UILabel!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: - NetworkInterface -
    
    func set(ipAddress: String?) {
        ipAddressLabel.text = ipAddress
    }
    
}
