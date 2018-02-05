//
//  CustomActivityIndicatorView.swift
//  CustomActivityIndicator
//
//  Created by Filiz Kurban on 2/4/18.
//  Copyright © 2018 Filiz Kurban. All rights reserved.
//

import Foundation

import UIKit

protocol CustomActivityIndicatorDataSource {
    func activityIndicatorParent() -> UIViewController
}

class CustomActivityIndicator: UIView {

    var isAnimating : Bool = false
    var hidesWhenStopped : Bool = true


    lazy private var animationLayer : CALayer = {
        return CALayer()
    }()

    var dataSource: CustomActivityIndicatorDataSource? {
        didSet {
            self.setupViews()
        }
    }

    // MARK:- Initialiser
    init(image:UIImage) {
        var frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)

        super.init(frame: frame)

        animationLayer.frame = frame
        animationLayer.contents = UIImage(named: "bird1")?.cgImage
        animationLayer.masksToBounds = true

        self.layer.addSublayer(animationLayer)

    }

    required init(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setupViews() {
        if self.dataSource != nil {
            self.removeFromSuperview()
            self.dataSource!.activityIndicatorParent().view.addSubview(self)
            self.center = self.dataSource!.activityIndicatorParent().view.center
        }

        //animate(forLayer: animationLayer)
    }

    func animate(forLayer layer: CALayer) {

        var animation:CABasicAnimation = CABasicAnimation(keyPath: "contents");

        let firstImage = UIImage(named: "bird1")?.cgImage;
        let secondImage = UIImage(named: "bird2")?.cgImage;

        animation.fromValue = firstImage
        animation.toValue   = secondImage
        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = 25
        animation.duration  = 0.2;

        layer.add(animation, forKey: "contents");
    }

    //partially implemented
    func startAnimation() {
         self.animate(forLayer: self.animationLayer)
    }

    //to be implemented
    func stopAnimation() {

    }

}
