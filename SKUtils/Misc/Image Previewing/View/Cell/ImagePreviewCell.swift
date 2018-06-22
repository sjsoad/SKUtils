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
//        var scale = CGFloat.minimum(scale, maximumZoomScale)
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
//        var destinationRect : CGRect = .zero
//        destinationRect.size.width = frame.width / scale
//        destinationRect.size.height = frame.height / scale
//        destinationRect.origin.x = translatedZoomPoint.x - destinationRect.width * 0.5
//        destinationRect.origin.y = translatedZoomPoint.y - destinationRect.height * 0.5
//
//        if animated {
//            UIView.animate(withDuration: 0.55, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.6, options: [.allowUserInteraction], animations: {
//                self.zoom(to: destinationRect, animated: false)
//            }, completion: {
//                completed in
//                if let delegate = self.delegate, delegate.responds(to: #selector(UIScrollViewDelegate.scrollViewDidEndZooming(_:with:atScale:))), let view = delegate.viewForZooming?(in: self) {
//                    delegate.scrollViewDidEndZooming!(self, with: view, atScale: scale)
//                }
//            })
//        } else {
//            zoom(to: destinationRect, animated: false)
//        }
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
        let yOffset = max(0, (bounds.size.height - imagePreview.frame.height) * 0.5)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        let xOffset = max(0, (bounds.size.width - imagePreview.frame.width) * 0.5)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        layoutIfNeeded()
    }
    
    private func calculateZoomScale(for image: UIImage) {

    }
    
    private func reset(for image: UIImage) {
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

private extension UIImage {

        func size(thatFits size: CGSize) -> CGSize {
            let aspectWidth = calculateAspectWidth(width: size.width)
            let aspectHeight = calculateAspectHeight(height: size.height)
            let aspectRatio = minAspectRation(aspectWidth: aspectWidth, aspectHeight: aspectHeight)
            return newSize(with: aspectRatio)
        }
        
        // MARK: - Private -
        
        private func calculateAspectWidth(width: CGFloat) -> CGFloat {
            return width / size.width
        }
        
        private func calculateAspectHeight(height: CGFloat) -> CGFloat {
            return height / size.height
        }
        
        private func minAspectRation(aspectWidth: CGFloat, aspectHeight: CGFloat) -> CGFloat {
            return min(aspectWidth, aspectHeight)
        }
        
        private func maxAspectRation(aspectWidth: CGFloat, aspectHeight: CGFloat) -> CGFloat {
            return max(aspectWidth, aspectHeight)
        }
        
        private func newSize(with aspectRatio: CGFloat) -> CGSize {
            var newSize = CGSize.zero
            newSize.width = size.width * aspectRatio
            newSize.height = size.height * aspectRatio
            return newSize
        }
    
}
