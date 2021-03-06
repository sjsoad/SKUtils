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
//        button.move(from: CGPoint(x: view.bounds.width, y: 0), delay: 0.5)
//        button.scale(to: CGPoint(x: 2, y: 2), delay: 0.5)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        button.move(to: CGPoint(x: view.bounds.width, y: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions -
    
    @IBAction func rippleEffectButtonPressed(_ sender: UIButton) {
//        animate(animationBlock: {
//            sender.rotate(by: 90)
////            sender.moveY(by: 150)
////            sender.scaleY(by: 1.4)
//        }, completion: {
//            print("1 completion")
//        }).thenAnimate(animationBlock: {
//            sender.alpha(to: 0.4)
//            sender.rotate(to: 270)
////            sender.moveX(by: 100)
//        }, completion: {
//            print("2 completion")
//        }).thenAnimate(animationBlock: {
//            sender.alpha(to: 1)
//            sender.cancelAllTransformations()
//        }, completion: {
//            print("3 completion")
//        })
        presenter?.viewTriggeredActionEvent()
    }
    
    // MARK: - ViewAnimationsInterface -
    
}
