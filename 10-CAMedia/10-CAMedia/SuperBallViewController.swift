//
//  SuperBallViewController.swift
//  10-CAMedia
//
//  Created by lz on 16/5/5.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class SuperBallViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SuperBall"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animateCustom()
    }
    
    func interpolate(from: CGFloat, to: CGFloat, time: CGFloat) -> CGFloat {
        return (to - from) * time + from
    }
    
    func interpolateFromValue(fromValue: CGPoint, toValue: CGPoint, time: CGFloat ) -> CGPoint {
        let result = CGPoint(x: interpolate(fromValue.x, to: toValue.x, time: time), y: interpolate(fromValue.y, to: toValue.y, time: time))
        return result
    }
    // 自定义的缓冲函数
    func bounceEaseOut(t: Float) -> Float
    {
        if (t < 4/11.0)
        {
            return (121 * t * t)/16.0;
        }
        else if (t < 8/11.0)
        {
            return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
        }
        else if (t < 9/10.0)
        {
            return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
        }
        
        return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0;
    }
    
//    func bounceEaseOut(t: Float) -> Float
//    {
//        if (t < 4/11.0)
//        {
//            return (121 * t * t)/16.0;
//        }
//        else if (t < 8/11.0)
//        {
//            return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0;
//        }
//        else if (t < 9/10.0)
//        {
//            return (4356/361.0 * t * t) - (35442/1805.0 * t) + 16061/1805.0;
//        }
//        
//        return (54/5.0 * t * t) - (513/25.0 * t) + 268/25.0;
//    }
    
    func animate() {
        let animation = CAKeyframeAnimation.init()
        animation.keyPath = "position"
        animation.duration = 1.0
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        animation.values = [NSValue.init(CGPoint: CGPoint(x: 150, y: 32)),NSValue.init(CGPoint: CGPoint(x: 150, y: 268)),NSValue.init(CGPoint: CGPoint(x: 150, y: 140)),NSValue.init(CGPoint: CGPoint(x: 150, y: 268)),NSValue.init(CGPoint: CGPoint(x: 150, y: 220)),NSValue.init(CGPoint: CGPoint(x: 150, y: 268)),NSValue.init(CGPoint: CGPoint(x: 150, y: 250)),NSValue.init(CGPoint: CGPoint(x: 150, y: 268))]
        let tf1 = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
        let tf2 = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        animation.timingFunctions = [tf1,tf2,tf1,tf2,tf1,tf2]
        animation.keyTimes = [0.0, 0.3, 0.5, 0.7, 0.8, 0.9, 0.95, 1.0]
        self.ballImageView.layer.addAnimation(animation, forKey: nil)
    }
    
    func animateCustom() {
        let fromValue = CGPoint(x: 150, y: 32)
        let toValue = CGPoint(x: 150, y: 268)
        let duration: CFTimeInterval = 1.0
        let numFrames = duration * 20
        var frames = [NSValue]()
        for (var i = 0.0; i < numFrames; i++) {
            var time = 1 / numFrames * i
            time = Double(bounceEaseOut(Float(time)))
            frames.append(NSValue.init(CGPoint: interpolateFromValue(fromValue, toValue: toValue, time: CGFloat(time))))
        }
        
        let animation = CAKeyframeAnimation.init()
        animation.keyPath = "position"
        animation.duration = 2.0
        animation.delegate = self
        animation.values = frames
        self.ballImageView.layer.addAnimation(animation, forKey: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
