//
//  FromViewController.swift
//  SKUtils
//
//  Created by Sergey on 11.07.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKCustomNavigation

class FromViewController: UIViewController, FromInterface, AnimationControllerProvider {

    var animatedTransitioning: CustomAnimatedTransitioning? = Push(transitionDirection: .fromTop)
    
    var presenter: FromOutput?

    @IBOutlet private weak var pictureView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    
    // MARK: - Lifecycle -

    // MARK: - IBActions -
    
    @IBAction func actionButtonPressed(_ sender: UIButton) {
        presenter?.viewTriggeredActionEvent()
    }
    
    // MARK: - FromInterface -
    
    // MARK: - SubviewsForAnimatiedTransitionProvider -
    
    var viewsToAnimate: [UIView] {
        return [pictureView, actionButton]
    }
    
}
