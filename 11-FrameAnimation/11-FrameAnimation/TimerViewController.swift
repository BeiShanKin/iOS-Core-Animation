//
//  TimerViewController.swift
//  11-FrameAnimation
//
//  Created by lz on 16/5/5.
//  Copyright © 2016年 SY. All rights reserved.
/*
当你设置一个NSTimer，他会被插入到当前任务列表中，然后直到指定时间过去之后才会被执行。但是何时启动定时器并没有一个时间上限，而且它只会在列表中上一个任务完成之后开始执行。这通常会导致有几毫秒的延迟，但是如果上一个任务过了很久才完成就会导致延迟很长一段时间。
屏幕重绘的频率是一秒钟六十次，但是和定时器行为一样，如果列表中上一个执行了很长时间，它也会延迟。这些延迟都是一个随机值，于是就不能保证定时器精准地一秒钟执行六十次。有时候发生在屏幕重绘之后，这就会使得更新屏幕会有个延迟，看起来就是动画卡壳了。有时候定时器会在屏幕更新的时候执行两次，于是动画看起来就跳动了。
我们可以通过一些途径来优化：
我们可以用CADisplayLink让更新频率严格控制在每次屏幕刷新之后。
基于真实帧的持续时间而不是假设的更新频率来做动画。
调整动画计时器的run loop模式，这样就不会被别的事件干扰。
*/

import UIKit

class TimerViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    
    var ballImageView: UIImageView?
    var timer: NSTimer?
    var duration: NSTimeInterval?
    var timeOffset: NSTimeInterval?
    var from: NSValue?
    var to: NSValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ballImageView = UIImageView.init(image: UIImage.init(named: "Ball"))
        self.ballImageView?.center.x = self.containerView.bounds.size.width * 0.5
        self.containerView.addSubview(self.ballImageView!)
    }
    
    func animation() {
        self.duration = 3.0
        self.timeOffset = 0.0
        self.from = NSValue.init(CGPoint: CGPoint(x: 150, y: 32))
        self.to = NSValue.init(CGPoint: CGPoint(x: 150, y: 268))
        self.timer?.invalidate()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1 / 60.0, target: self, selector: "step:", userInfo: nil, repeats: true)
    }
    
    func step(step: NSTimer) {
        self.timeOffset = min(self.timeOffset! + 1/60.0, self.duration!)
        var time = Float(self.timeOffset! / self.duration!)
        time = bounceEaseOut(time)
        let position = interpolateFromValue((self.from?.CGPointValue())!, toValue: (self.to?.CGPointValue())!, time: CGFloat(time))
        print(position)
        self.ballImageView?.center = position
        if (self.timeOffset >= self.duration) {
            self.timer?.invalidate()
            self.timer = nil
        }
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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
