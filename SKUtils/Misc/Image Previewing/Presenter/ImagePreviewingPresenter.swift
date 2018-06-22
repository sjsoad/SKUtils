//
//  ImagePreviewingPresenter.swift
//  SKUtils
//
//  Created by Sergey on 22.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//

import Foundation
import SKDataSources

protocol ImagePreviewingInterface: class {
    
    func reload(with dataSource: CollectionViewArrayDataSource)
    func scroll(toItemAt index: Int, aniamted: Bool)
    func indexPathesOfVisibleCells() -> [IndexPath]
}

protocol ImagePreviewingOutput {
    
    func viewDidLoad()
    
}

class ImagePreviewingPresenter: NSObject {
    
    private(set) weak var view: ImagePreviewingInterface?
    
    private(set) var previewItems: [ImagePreviewItem]
    
    private var initialItemIndex: Int
    private var dataSource: CollectionViewArrayDataSource = {
        let section = SectionModel(withItems: [])
        let dataSource = CollectionViewArrayDataSource(with: [section])
        return dataSource
    }()
    
    init(with view: ImagePreviewingInterface, previewItems: [ImagePreviewItem], initialItemIndex: Int) {
        self.view = view
        self.previewItems = previewItems
        self.initialItemIndex = initialItemIndex
    }
    
    // MARK: - Public -
    
    func createDataSourseObjects(from previewItems: [ImagePreviewItem]) -> [DataSourceObjectPresenter] {
        var items = [DataSourceObjectPresenter]()
        for item in previewItems {
            let dataSourceModel = ImagePreviewCellPresenter(with: item, cellIdentifier: ImagePreviewCell.reuseIdentifier)
            items.append(dataSourceModel)
        }
        return items
    }
    
    func currentVisibleItems() -> [ImagePreviewItem] {
        guard let indexPathesOfVisibleCells = view?.indexPathesOfVisibleCells() else { return [] }
        let presenters: [ImagePreviewCellPresenter] = indexPathesOfVisibleCells.compactMap({ dataSource.itemAtIndexPath(indexPath: $0) })
        return presenters.compactMap({ $0.model })
    }
}

// MARK: - ImagePreviewingPresenterOutput -

extension ImagePreviewingPresenter: ImagePreviewingOutput {

    func viewDidLoad() {
        let dataSourceObjectPresenters = createDataSourseObjects(from: previewItems)
        dataSource.append(items: dataSourceObjectPresenters, toSectionAtIndex: 0) { [weak self] (_) in
            guard let strongSelf = self else { return }
            strongSelf.view?.reload(with: strongSelf.dataSource)
            strongSelf.view?.scroll(toItemAt: strongSelf.initialItemIndex, aniamted: false)
        }
    }
    
}
