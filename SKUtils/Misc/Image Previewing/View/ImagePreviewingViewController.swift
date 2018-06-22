//
//  ImagePreviewingViewController.swift
//  SKUtils
//
//  Created by Sergey on 22.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import UIKit
import SKDataSources

class ImagePreviewingViewController: UIViewController, ImagePreviewingInterface, UICollectionViewDelegateFlowLayout {

    var presenter: ImagePreviewingOutput?

    @IBOutlet private(set) weak var collectionView: UICollectionView!
    
    private var sectionInsets: UIEdgeInsets = .zero
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        setup(collectionView)
        presenter?.viewDidLoad()
    }

    // MARK: - Public -
    
    func setup(_ collectionView: UICollectionView) {
        let cellNib = UINib(nibName: ImagePreviewCell.nibName, bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: ImagePreviewCell.reuseIdentifier)
        collectionView.isPagingEnabled = true
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.sectionInset = .zero
        flowLayout.scrollDirection = .horizontal
    }
    
    // MARK: - ImagePreviewingInterface -
    
    func reload(with dataSource: CollectionViewArrayDataSource) {
        collectionView.dataSource = dataSource
        collectionView.reloadData()
    }
    
    func scroll(toItemAt index: Int, aniamted: Bool) {
        collectionView.layoutIfNeeded()
        let indexPath = IndexPath(item: index, section: 0)
        guard collectionView.numberOfSections > indexPath.section, indexPath.section >= 0,
            collectionView.numberOfItems(inSection: indexPath.section) > indexPath.row, indexPath.row >= 0 else { return }
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: aniamted)
    }
    
    func indexPathesOfVisibleCells() -> [IndexPath] {
        return collectionView.indexPathsForVisibleItems
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout -
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height - sectionInsets.top - sectionInsets.bottom
        let width = collectionView.bounds.width - sectionInsets.left - sectionInsets.right
        return CGSize(width: width, height: height)
    }
    
}
