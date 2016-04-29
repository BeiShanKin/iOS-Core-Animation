//
//  ClockViewController.swift
//  08-ExplicitAnimation
//
//  Created by lz on 16/4/27.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {

    var hourHand: UIImageView?
    var minuteHand: UIImageView?
    var secondHand: UIImageView?
    var timer: NSTimer?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpClock()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "tick", userInfo: nil, repeats: true)
        updateClockWithAnimation(false)
    }
    
    func setUpClock() {
        let clockFace = UIImageView.init(image: UIImage.init(named: "ClockFace"))
        let hourHand = UIImageView.init(image: UIImage.init(named: "HourHand"))
        let minuteHand = UIImageView.init(image: UIImage.init(named: "MinuteHand"))
        let secondHand = UIImageView.init(image: UIImage.init(named: "SecondHand"))
        
        clockFace.center = self.view.center
        hourHand.center = self.view.center
        minuteHand.center = self.view.center
        secondHand.center = self.view.center
        
        hourHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.85)
        minuteHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.85)
        secondHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.85)
        
        self.view.addSubview(clockFace)
        self.view.addSubview(hourHand)
        self.view.addSubview(minuteHand)
        self.view.addSubview(secondHand)
        
        self.hourHand = hourHand
        self.minuteHand = minuteHand
        self.secondHand = secondHand
    }
    
    func tick() {
        updateClockWithAnimation(true)
    }
    
    func updateClockWithAnimation(animated: Bool) {
        let components = getCurrentTimeComponent()
        let hourAngle = CGFloat(components.hour) / 12 * CGFloat(M_PI) * 2.0
        let minuteAngle = CGFloat(components.minute) / 60 * CGFloat(M_PI) * 2.0
        let secondAngle = CGFloat(components.second) / 60 * CGFloat(M_PI) * 2.0
        
        setAngle(hourAngle, handView: self.hourHand!, animated: animated)
        setAngle(minuteAngle, handView: self.minuteHand!, animated: animated)
        setAngle(secondAngle, handView: self.secondHand!, animated: animated)
//        self.hourHand?.layer.setAffineTransform(CGAffineTransformMakeRotation(hourAngle))
//        self.minuteHand?.layer.setAffineTransform(CGAffineTransformMakeRotation(minuteAngle))
//        self.secondHand?.layer.setAffineTransform(CGAffineTransformMakeRotation(secondAngle))
    }
    
    func setAngle(angle: CGFloat,handView: UIImageView,animated: Bool) {
        if (animated) {
            let animation = CABasicAnimation.init()
            // 这句话应该去掉，没什么卵用。。。。。不知道是不是书上的排版错误
//            updateClockWithAnimation(false)
            animation.keyPath = "transform"
            animation.toValue = NSValue(CATransform3D: CATransform3DMakeRotation(angle, 0, 0, 1))
            animation.duration = 0.5
            animation.delegate = self
            animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionDefault)
            // 如果removedOnCompletion 为 ture,那么不论fillMode是什么，动画效果结束后，都会恢复原样。如果removedOnCompletion 为 false,fillMode 为kCAFillModeForwards 和 kCAFillModeBoth时，会让图层处于新位置，为其他值是不会。
            animation.fillMode = kCAFillModeForwards
            // 动画结束时是否从呈现树种移除，默认是true。如果设为false时，动画就不会自动被移除，所以最好在添加动画时设置一个非nil的key，方便以后移除
            animation.removedOnCompletion = false
            animation.setValue(handView, forKey: "handView")
            handView.layer.addAnimation(animation, forKey: nil)
        } else {
            handView.layer.setAffineTransform(CGAffineTransformMakeRotation(angle))
            print(animated)
        }
    }
    
    func getCurrentTimeComponent() -> NSDateComponents {
        let calendar = NSCalendar.init(calendarIdentifier: NSCalendarIdentifierGregorian)
        let date = NSDate.init()
        let components = calendar?.components([.Hour, .Minute, .Second], fromDate: date)
//        print(components)
        return components!
    }
    
//    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
//        let handView = anim.valueForKey("handView")
//        let animation = anim as! CABasicAnimation
//        handView?.layer.transform = (animation.toValue?.CATransform3DValue)!
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
