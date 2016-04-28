//
//  ColorKeyViewController.swift
//  08-ExplicitAnimation
//
//  Created by lz on 16/4/27.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class ColorKeyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let animation = CAKeyframeAnimation.init()
        animation.keyPath = "backgroundColor"
        animation.duration = 3.0
        animation.repeatCount = Float(INTMAX_MAX)
        animation.values = [UIColor.redColor().CGColor, UIColor.blueColor().CGColor, UIColor.blackColor().CGColor]
        self.view.layer.addAnimation(animation, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
