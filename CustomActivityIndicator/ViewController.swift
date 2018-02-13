//
//  ViewController.swift
//  CustomActivityIndicator
//
//  Created by Filiz Kurban on 2/1/18.
//  Copyright © 2018 Filiz Kurban. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var birdView: UIView!
    @IBOutlet weak var birdImage: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //prep work for animation
        //Make sure the animation images follow the same image name convention. Example here is "bird" followed by number: bird1.jpg, bird2.jpg, bird3.jpg, etc. I only have two images so it goes up to 2.
        var a = [UIImage]()
        for i in 1...2 {
            let imageName = "bird" + String(i)
            print(imageName)
            if let image = UIImage(named:imageName) {
                a.append(image)
            }
        }

        birdImage.animationImages = a
        birdImage.animationDuration = 0.30
        birdImage.startAnimating()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

