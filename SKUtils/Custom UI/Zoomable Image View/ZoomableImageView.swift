//
//  ZoomableImageView.swift
//  Hanabi
//
//  Created by Sergey Kostyan on 10/5/18.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

class ZoomableImageView: UIView {
    
    private lazy var scrollView: UIScrollView? = { [unowned self] in
        let scrollView = UIScrollView(withDelegate: self)
        scrollView.add(to: self)
        return scrollView
        }()
    
    private lazy var imageView: UIImageView? = { [unowned self] in
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        scrollView?.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: scrollView!.topAnchor).activate()
        imageView.leadingAnchor.constraint(equalTo: scrollView!.leadingAnchor).activate()
        imageView.bottomAnchor.constraint(equalTo: scrollView!.bottomAnchor).activate()
        imageView.trailingAnchor.constraint(equalTo: scrollView!.trailingAnchor).activate()
        widthContraint = imageView.widthAnchor.constraint(equalToConstant: 0).activate()
        heightContraint = imageView.heightAnchor.constraint(equalToConstant: 0).activate()
        return imageView
        }()
    
    private var widthContraint: NSLayoutConstraint?
    private var heightContraint: NSLayoutConstraint?
    
    // MARK: - Lifecyrcle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addDoubleTap()
        set(zoomScale: minimumScale, animated: false)
        NotificationCenter.default.addObserver(self, selector: #selector(handleRotation), name: UIDevice.orientationDidChangeNotification)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resizeImageView()
        centerImageView()
    }
    
    // MARK: - Public -
    
    @IBInspectable var fillImage: Bool = false
    
    @IBInspectable var minimumScale: CGFloat {
        get { return scrollView?.minimumZoomScale ?? 1 }
        set { scrollView?.minimumZoomScale = newValue }
    }
    
    @IBInspectable var maximumZoomScale: CGFloat {
        get { return scrollView?.maximumZoomScale ?? 1 }
        set { scrollView?.maximumZoomScale = newValue }
    }
    
    var image: UIImage? {
        return imageView?.image
    }
    
    var imageSize: CGSize {
        guard !fillImage else { return bounds.size }
        return image?.size(thatFits: bounds.size) ?? .zero
    }
    
    var zoomScale: CGFloat {
        return scrollView?.zoomScale ?? 1
    }
    
    func set(image: UIImage?) {
        let tmpImage = UIImage(named: "nature")
        imageView?.image = tmpImage//image
    }
    
    func set(zoomScale: CGFloat, animated: Bool = true) {
        scrollView?.setZoomScale(zoomScale, animated: animated)
    }
    
    func resetZoom() {
        scrollView?.resetZoom()
    }
    
    // MARK: - Private -
    
    private func addDoubleTap() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(imageDoubleTapped(_ :)))
        doubleTap.numberOfTapsRequired = 2
        imageView?.addGestureRecognizer(doubleTap)
    }

    private func resizeImageView() {
        widthContraint?.constant = imageSize.width
        heightContraint?.constant = imageSize.height
        layoutIfNeeded()
    }
    
    private func centerImageView() {
        scrollView?.addInsetsToCenter(for: imageSize)
    }
    
    // MARK: - Actions -
    
    @objc private func imageDoubleTapped(_ sender: UITapGestureRecognizer) {
        if scrollView?.canZoom == true {
            scrollView?.zoom(to: sender.locationRect, animated: true)
        } else {
            scrollView?.zoomToMinimum()
        }
    }
    
    @objc private func handleRotation() {
        scrollView?.resetZoom()
    }
    
}

extension ZoomableImageView: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImageView()
    }
    
}

private extension NotificationCenter {
    
    func addObserver(_ observer: Any, selector aSelector: Selector, name aName: NSNotification.Name?) {
        addObserver(observer, selector: aSelector, name: aName, object: nil)
    }
    
}

private extension NSLayoutConstraint {
    
    @discardableResult
    func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
    
}

private extension UIScrollView {
    
    var canZoom: Bool {
        return zoomScale < maximumZoomScale
    }
    
    func zoomToMinimum() {
        setZoomScale(minimumZoomScale, animated: true)
    }
    
    func resetZoom() {
        let oldZoom = zoomScale
        setZoomScale(maximumZoomScale, animated: false)
        setZoomScale(oldZoom, animated: false)
    }
    
    func addInsetsToCenter(for size: CGSize) {
        let verticalInset = max(0, (bounds.size.height - size.height * zoomScale) * 0.5)
        let horizontalInset = max(0, (bounds.size.width - size.width * zoomScale) * 0.5)
        contentInset = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
    }
    
    convenience init(withDelegate delegate: UIScrollViewDelegate) {
        self.init()
        self.delegate = delegate
    }
    
}

private extension UIImage {
    
    func size(thatFits sizeToFit: CGSize) -> CGSize {
        let aspectWidth = sizeToFit.width / size.width
        let aspectHeight = sizeToFit.height / size.height
        let aspectRatio = min(aspectWidth, aspectHeight)
        return newSize(with: aspectRatio)
    }
    
    func newSize(with aspectRatio: CGFloat) -> CGSize {
        var newSize = CGSize.zero
        newSize.width = size.width * aspectRatio
        newSize.height = size.height * aspectRatio
        return newSize
    }
    
}
