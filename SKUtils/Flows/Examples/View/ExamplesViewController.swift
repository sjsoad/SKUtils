//
//  ExamplesViewController.swift
//  SKUtils
//
//  Created by Sergey on 04.09.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKDataSources
import SKCustomNavigation
import SKAnimator

class ExamplesViewController: UIViewController, ExamplesInterface, AnimationControllerProvider {

    var presenter: ExamplesOutput?

    var animatedTransitioning: CustomAnimatedTransitioning? = Push(transitionDirection: .fromLeft)
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Lifecycle -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reload))
        setup(tableView: tableView)
        presenter?.viewDidLoad()
    }
    
    // MARK: - Actions -
    
    @objc func reload() {
        // Animation examples
        // 1
        //        tableView.reload(with: [AlphaAnimationProvider(), TransformAnimationProvider.flipFromBottom()])
        // 2
        //        tableView.reload(with: [AlphaAnimationProvider()])
        // 3
        tableView.reload(with: [AlphaAnimationProvider(), TransformAnimationProvider.moveFromVertical(position: tableView.bounds.maxY)],
                         animatorProvider: ControlPointAnimatorProvider())
        // 4
        //        tableView.reload(with: [AlphaAnimationProvider(), TransformAnimationProvider.moveFromVertical(position: -tableView.bounds.maxY)])
        // 3
        //        tableView.reload(with: [AlphaAnimationProvider(), TransformAnimationProvider.moveFromHorizontal(position: tableView.bounds.maxX)],
        //                         animatorProvider: SpringAnimatorProvider())
        // 4
        //        tableView.reload(with: [AlphaAnimationProvider(), TransformAnimationProvider.moveFromHorizontal(position: -tableView.bounds.maxX)],
        //                         animatorProvider: SpringAnimatorProvider())
    }
    
    // MARK: - Private -
    
    private func setup(tableView: UITableView) {
        let cellNib = UINib(nibName: ExampleCell.nibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: ExampleCell.reuseIdentifier)
    }
    
    // MARK: - ExamplesInterface -
    
    func set(dataSource: TableViewArrayDataSourceRepresentable) {
        tableView.dataSource = dataSource
        reload()
    }
    
}

extension ExamplesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.viewTriggeredCellSelection(at: indexPath)
    }

}
