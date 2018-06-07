//
//  MainMenuViewController.swift
//  SKUtils
//
//  Created by Sergey Kostyan on 09.05.2018.
//Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKDataSources

class MainMenuViewController: UIViewController, MainMenuInterface, ViewControllerAnimatedTransitioningProvider {

    var presenter: MainMenuOutput?
    var animationController: TransitionManaging? = TransitionManager(transitionAnimationProvider: FallTransitionAnimation())
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setup(tableView: tableView)
        presenter?.viewDidLoad()
    }

    // MARK: - Private -
    
    private func setup(tableView: UITableView) {
        let cellNib = UINib(nibName: MainMenuCell.nibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: MainMenuCell.reuseIdentifier)
    }
    
    // MARK: - MainMenuInterface -
    
    func set(dataSource: TableViewArrayDataSource) {
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
}

extension MainMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.viewTriggeredCellSelection(at: indexPath)
    }
    
}
