//
//  VirtualViewController.swift
//  08-ExplicitAnimation
//
//  Created by lz on 16/4/28.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class VirtualViewController: UIViewController {

    var layer: CALayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.layer = CALayer.init()
        self.layer?.frame = CGRect(x: 0, y: 0, width: 20, height: 100)
        self.layer?.contents = UIImage.init(named: "HourHand")?.CGImage
        self.layer?.position = self.view.center
        self.view.layer.addSublayer(self.layer!)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animationWithVirtualProperty()
    }
    
    func animationWithTransform() {
        let animation = CABasicAnimation.init()
        animation.keyPath = "transform"
        // 通过显示动画进行旋转似乎只求结果，不求过程，不论怎么调整transform的值，都会走最短路程来旋转。
        //        animation.toValue = NSValue(CATransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4 * 6), 0, 0, 1))
        // 当旋转一周时，由于上面的原因，结果就是根本不转动。
        //        animation.toValue = NSValue(CATransform3D: CATransform3DMakeRotation(CGFloat(M_PI * 2), 0, 0, 1))
        
        animation.byValue = NSValue(CATransform3D: CATransform3DMakeRotation(CGFloat(M_PI_2), 0, 0, 1))
        animation.duration = 3.0
        self.layer?.addAnimation(animation, forKey: nil)
    }
    
    func animationWithVirtualProperty() {
        let animation = CABasicAnimation.init()
        // 这里使用的是虚拟属性，同样的还有transform.position和transform.scale
        animation.keyPath = "transform.rotation"
        animation.toValue = M_PI * 2.0
        animation.duration = 3.0
        self.layer?.addAnimation(animation, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
