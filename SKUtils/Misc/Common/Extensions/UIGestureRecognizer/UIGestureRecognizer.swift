//
//  UIGestureRecognizer.swift
//  Hanabi
//
//  Created by Sergey on 10/1/18.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

extension UIGestureRecognizer {
    
    var location: CGPoint {
        return location(in: view)
    }
    
    var locationRect: CGRect {
        return CGRect(origin: location(in: view), size: .zero)
    }
    
}
