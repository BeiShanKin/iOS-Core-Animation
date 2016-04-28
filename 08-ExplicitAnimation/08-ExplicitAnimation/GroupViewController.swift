//
//  GroupViewController.swift
//  08-ExplicitAnimation
//
//  Created by lz on 16/4/28.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let path = UIBezierPath.init()
        path.moveToPoint(CGPoint(x: 0, y: 150))
        path.addCurveToPoint(CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        
        let shapeLayer = CAShapeLayer.init()
        shapeLayer.path = path.CGPath
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = UIColor.greenColor().CGColor
        shapeLayer.lineWidth = 3.0
        self.view.layer.addSublayer(shapeLayer)
        
        let layer = CALayer.init()
        layer.frame = CGRect(x: 0, y: 0, width: 65, height: 64)
        layer.position = CGPoint(x: 0, y: 150)
        layer.backgroundColor = UIColor.greenColor().CGColor
        self.view.layer.addSublayer(layer)
        
        let keyAnimation = CAKeyframeAnimation.init()
        keyAnimation.keyPath = "position"
        keyAnimation.path = path.CGPath
//        keyAnimation.duration = 1.0;
        keyAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        keyAnimation.rotationMode = kCAAnimationRotateAuto
        
//        let baseAnimation = CABasicAnimation.init()
//        baseAnimation.keyPath = "backgroundColor"
//        baseAnimation.toValue = UIColor.redColor().CGColor
        let colorAnimation = CAKeyframeAnimation.init()
        colorAnimation.keyPath = "backgroundColor"
        colorAnimation.values = [UIColor.blueColor().CGColor,UIColor.redColor().CGColor,UIColor.yellowColor().CGColor]
        colorAnimation.keyTimes = [0.5,1.0,1.5]
        colorAnimation.duration = 2.0
        
        let animationGroup = CAAnimationGroup.init()
        animationGroup.animations = [colorAnimation,keyAnimation]
        // 当子动画效果设置了时间时，动画组设置的时间就没用啦，如果子动画没有设置时间，就由动画组的时间决定。
        animationGroup.duration = 4.0
        
        layer.addAnimation(animationGroup, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
