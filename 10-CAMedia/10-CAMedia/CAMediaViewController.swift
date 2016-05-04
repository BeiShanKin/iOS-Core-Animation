//
//  CAMediaViewController.swift
//  10-CAMedia
//
//  Created by lz on 16/5/4.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class CAMediaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CAMedia"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let animation = CAKeyframeAnimation.init()
        animation.keyPath = "backgroundColor"
        animation.duration = 5.0
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        animation.values = [UIColor.redColor().CGColor,UIColor.yellowColor().CGColor,UIColor.blueColor().CGColor]
        let tf1 = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        let tf2 = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        let tf3 = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionDefault)
        animation.timingFunctions = [tf1,tf2,tf3]
        self.view.layer.addAnimation(animation, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
