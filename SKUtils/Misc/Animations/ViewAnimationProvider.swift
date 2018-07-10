//
//  ViewAnimationProvider.swift
//  SKUtils
//
//  Created by Sergey on 19.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

public protocol ViewAnimationProvider {

    func prepare(_ view: UIView)
    func perform(for view: UIView)
    
}
