//
//  Module.swift
//  Places
//
//  Created by Evgeniy Leychenko on 27.04.2018.
//  Copyright © 2018 tas. All rights reserved.
//

import Foundation
import UIKit

class Module<PresenterType, InterfaceType> {
    
    private(set) var presenter: PresenterType
    private(set) var interface: InterfaceType
    
    init(presenter: PresenterType, interface: InterfaceType) {
        self.presenter = presenter
        self.interface = interface
    }
}
