//
//  ImagePreviewCell.swift
//  SKUtils
//
//  Created by Sergey on 22.06.2018.
//  Copyright © 2018 Sergey Kostyan. All rights reserved.
//
// use APIClient for executing this requests

import UIKit
import Foundation
import SKDataSources
import AlamofireImage

class ImagePreviewCell: UICollectionViewCell, DataSourceObjectInterface, Reusable, Nibable, ImagePreviewCellInterface, UIScrollViewDelegate {
    
    var presenter: ImagePreviewOutput?
    
    @IBOutlet private(set) weak var activity: UIActivityIndicatorView!
    @IBOutlet private(set) weak var scroll: UIScrollView!
    @IBOutlet private(set) weak var imagePreview: UIImageView!
    
    @IBOutlet private(set) weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imagePreview.af_cancelImageRequest()
        activity.startAnimating()
        imagePreview.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addDoubleTapGesture()
    }
    
    // MARK: - Public -
    
    @objc func doubleTapped(_ sender: UITapGestureRecognizer) {
//        let zoomPoint = sender.
//        var scale = CGFloat.minimum(scale, scroll)
//        scale = CGFloat.maximum(scale, self.minimumZoomScale)
//
//        var translatedZoomPoint : CGPoint = .zero
//        translatedZoomPoint.x = zoomPoint.x + contentOffset.x
//        translatedZoomPoint.y = zoomPoint.y + contentOffset.y
//
//        let zoomFactor = 1.0 / zoomScale
//
//        translatedZoomPoint.x *= zoomFactor
//        translatedZoomPoint.y *= zoomFactor
//
//        var destinationRect: CGRect = .zero
//        destinationRect.size.width = frame.width / scale
//        destinationRect.size.height = frame.height / scale
//        destinationRect.origin.x = translatedZoomPoint.x - destinationRect.width * 0.5
//        destinationRect.origin.y = translatedZoomPoint.y - destinationRect.height * 0.5
    }
    
    // MARK: - Private -
    
    private func addDoubleTapGesture() {
        imagePreview.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped(_:)))
        tap.numberOfTapsRequired = 2
        imagePreview.addGestureRecognizer(tap)
    }
    
    private func  resetZoomScale() {
        scroll.setZoomScale(scroll.minimumZoomScale, animated: true)
    }
    
    private func layoutImage() {
        layoutIfNeeded()
        let yOffset = max(0, (bounds.size.height - imagePreview.frame.height) / 2)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        let xOffset = max(0, (bounds.size.width - imagePreview.frame.width) / 2)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        layoutIfNeeded()
    }
    
    private func calculateZoomScale(for image: UIImage) {

    }
    
    private func updateContaints(for image: UIImage) {
        
    }
    
    private func reset(for image: UIImage) {
        updateContaints(for: image)
        calculateZoomScale(for: image)
        resetZoomScale()
        layoutImage()
    }
    
    // MARK: - DataSourceObjectInterface -
    
    func set(presenter: DataSourceObjectPresenter) {
        self.presenter = presenter as? ImagePreviewOutput
    }
    
    // MARK: - ImagePreviewCellInterface -
    
    func set(_ image: UIImage) {
        imagePreview.image = image
        activity.stopAnimating()
        reset(for: image)
    }

    func set(_ imageURL: URL, placeholderImage: UIImage?) {
        imagePreview.af_setImage(withURL: imageURL, placeholderImage: placeholderImage) { [weak self] (response) in
            guard let image = response.result.value else { return }
            self?.activity.stopAnimating()
            self?.reset(for: image)
        }
    }
    
    // MARK: - UIScrollViewDelegate -
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imagePreview
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        layoutImage()
    }
    
}
