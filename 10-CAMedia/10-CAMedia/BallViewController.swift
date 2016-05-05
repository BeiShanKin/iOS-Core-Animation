//
//  BallViewController.swift
//  10-CAMedia
//
//  Created by lz on 16/5/5.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class BallViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ball"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animate()
    }
    
    func animate() {
        let animation = CAKeyframeAnimation.init()
        animation.keyPath = "position"
        animation.duration = 1.0
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        animation.values = [
                            NSValue.init(CGPoint: CGPoint(x: 150, y: 32)),
                            NSValue.init(CGPoint: CGPoint(x: 150, y: 268)),
                            NSValue.init(CGPoint: CGPoint(x: 150, y: 140)),
                            NSValue.init(CGPoint: CGPoint(x: 150, y: 268)),
                            NSValue.init(CGPoint: CGPoint(x: 150, y: 220)),
                            NSValue.init(CGPoint: CGPoint(x: 150, y: 268)),
                            NSValue.init(CGPoint: CGPoint(x: 150, y: 250)),
                            NSValue.init(CGPoint: CGPoint(x: 150, y: 268))
        ]
        let tf1 = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        let tf2 = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        animation.timingFunctions = [tf1,tf2,tf1,tf2,tf1,tf2]
        animation.keyTimes = [0.0, 0.3, 0.5, 0.7, 0.8, 0.9, 0.95, 1.0]
        self.ballImageView.layer.addAnimation(animation, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
