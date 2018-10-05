//
//  UIView.swift
//  Hanabi
//
//  Created by Sergey on 20.09.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - IBInspectable -
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            return layer.borderColor?.uiColor
        }
    }
    
    // MARK: - Load -
    
    static func nib(with name: String? = nil) -> UINib {
        let nibName = name ?? "\(self)"
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static func instantiateFromNib(with name: String? = nil) -> Self? {
        func instanceFromNib<T: UIView>() -> T? {
            return nib(with: name).instantiate() as? T
        }
        return instanceFromNib()
    }
    
    // MARK: - Child -
    
    func add(to container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(self)
        topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
    
    // MARK: - Mask -
    
    func round(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    // MARK: - Round -
    
    func rounded() {
        layer.cornerRadius = bounds.midX
        layer.masksToBounds = true
    }
    
    // MARK: - Animations -
    
    static func animate(_ animations: @escaping () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.25, animations: animations, completion: completion)
    }
    
    static func animate(_ animations: @escaping () -> Void, with delay: TimeInterval) {
        UIView.animate(withDuration: 0.25, delay: delay, animations: animations)
    }
    
    // MARK: - Utils -
    
    func center(in bounds: CGRect) {
        frame.origin.x = max(0, (bounds.size.width - frame.size.width) * 0.5)
        frame.origin.y = max(0, (bounds.size.height - frame.size.height) * 0.5)
    }
    
}

fileprivate extension CGColor {
    var uiColor: UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}

fileprivate extension UINib {
    
    func instantiate() -> Any? {
        return instantiate(withOwner: nil, options: nil).first
    }
    
}
