//
//  ViewController.swift
//  CustomActivityIndicator
//
//  Created by Filiz Kurban on 2/1/18.
//  Copyright © 2018 Filiz Kurban. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomActivityIndicatorDataSource{

    @IBOutlet weak var birdView: UIView!
    @IBOutlet weak var birdImage: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!


    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0

            progressView.setProgress(fractionalProgress, animated: animated)
            print("\(counter)%")
        }
    }

    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation1()
        scheduleStopForAnimation1()
        startAnimation2()
        startAnimation3()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: Animation1
    func startAnimation1() {
        let a :[UIImage] = [UIImage(named:"bird1")!,UIImage(named:"bird2")!]
        birdImage.animationImages = a
        birdImage.animationDuration = 0.5
        birdImage.startAnimating()
    }

    @objc func stopAnimation1() {
        birdImage.stopAnimating()
        birdImage.image = UIImage(named:"bird1")
    }

    func scheduleStopForAnimation1() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (timerReturned) in
            self.stopAnimation1()
        })
    }

    //MARK: Animation2
    func startAnimation2() {
        let customAIV = CustomActivityIndicator(image: birdImage.image!)
        customAIV.dataSource = self
        customAIV.startAnimation()
    }

    func activityIndicatorParent() -> UIViewController {
        return self
    }

    @IBAction func animateButtonTapped(_ sender: Any) {
        startAnimation2()
    }


    //MARK: Animation3
    func startAnimation3() {
        print("0%")
        self.counter = 0
        for _ in 0..<100 {
            DispatchQueue.global(qos: .userInitiated).async {
                sleep(1)
                // Bounce back to the main thread to update the UI
                DispatchQueue.main.async {
                    self.counter = self.counter + 1
                }
            }
        }
    }


}

