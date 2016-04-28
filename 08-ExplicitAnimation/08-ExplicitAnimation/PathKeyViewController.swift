//
//  PathKeyViewController.swift
//  08-ExplicitAnimation
//
//  Created by lz on 16/4/27.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class PathKeyViewController: UIViewController {

    var star: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let star = UIView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        star.layer.contents = UIImage.init(named: "HourHand")?.CGImage
//        star.layer.cornerRadius = 25.0
//        star.layer.masksToBounds = true
//        star.center = self.view.center
//        star.backgroundColor = UIColor.redColor()
        self.view.addSubview(star);
        self.star = star
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 直接画圆会出现转动90°就会停一下的情况，通过画弧线就不会出现这种情况
//        let path = UIBezierPath.init(roundedRect: CGRect(x: 5, y: 95, width: 300, height: 300), cornerRadius: 150)
        let path = UIBezierPath.init()
//        path.moveToPoint(CGPoint(x: 20, y: 150))
        path.addArcWithCenter(self.view.center, radius: 150, startAngle: 0, endAngle: CGFloat(M_PI) * 2.0, clockwise: true)
//        path.addCurveToPoint(CGPoint(x: 300, y: 150), controlPoint1: CGPoint(x: 75, y: 0), controlPoint2: CGPoint(x: 225, y: 300))
        let pathLayer = CAShapeLayer.init()
        pathLayer.path = path.CGPath
        pathLayer.strokeColor = UIColor.blackColor().CGColor
        pathLayer.fillColor = UIColor.clearColor().CGColor
        pathLayer.lineWidth = 3.0
        self.view.layer.addSublayer(pathLayer)
        
        let animation = CAKeyframeAnimation.init()
        animation.keyPath = "position"
        animation.path = path.CGPath
        animation.duration = 5.0
        animation.rotationMode = kCAAnimationRotateAuto
        animation.repeatCount = 20
        self.star?.layer.addAnimation(animation, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
