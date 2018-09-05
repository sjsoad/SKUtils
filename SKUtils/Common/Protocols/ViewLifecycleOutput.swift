//
//  ViewLifecycleOutput.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol ViewLifecycleOutput {
    
    func viewDidLoad()
    func viewWillAppear()
    func viewWillDissapear()
    
}

extension ViewLifecycleOutput {
    
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewWillDissapear() {}
    
}
