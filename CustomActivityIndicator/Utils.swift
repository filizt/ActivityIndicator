//
//  Utils.swift
//  CustomActivityIndicator
//
//  Created by Filiz Kurban on 2/4/18.
//  Copyright © 2018 Filiz Kurban. All rights reserved.
//

import UIKit


//Will add the other animation functions here for refrencing later
class Utils{

    //if we know how much time this animation will play for. This is not ideal for an activity indicator but a good example of how the animation works.
//    func startAnimation1() {
//
//        UIView.animate(withDuration: 2.0, delay: 0.2, options: [.repeat, .autoreverse], animations: { self.birdImage.transform = CGAffineTransform(rotationAngle: -80) }, completion: nil)
//
//    }

    //This is with Core Animation framework; though single image animation.
//    func startAnimation5() {
//        let overlay = UIImageView(image: UIImage(named: "bird2"))
//        overlay.frame = birdImage.frame
//        overlay.contentMode = birdImage.contentMode
//        overlay.center = birdImage.center
//        overlay.alpha = 0.0
//
//        birdImage.superview!.insertSubview(overlay, aboveSubview:birdImage)
//
//        overlay.transform = CGAffineTransform(scaleX: 1.2, y:1.2)
//
//        UIView.animate(withDuration: 0.5, animations: {
//            overlay.alpha = 1.0
//            overlay.transform = .identity
//        }) { (_) in
//            self.birdImage.image = overlay.image
//            overlay.removeFromSuperview()
//        }
//
//
//    }
}
