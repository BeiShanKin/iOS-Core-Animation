//
//  CADisplayViewController.swift
//  11-FrameAnimation
//
//  Created by lz on 16/5/5.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class CADisplayViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    var ballImageView: UIImageView?
    var timer: CADisplayLink?
    var duration: CFTimeInterval?
    var timeOffset: CFTimeInterval?
    var lastStep: CFTimeInterval?
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
        self.lastStep = CACurrentMediaTime()
        self.timer = CADisplayLink.init(target: self, selector: "step:")
        /*
        NSDefaultRunLoopMode - 标准优先级
        NSRunLoopCommonModes - 高优先级
        UITrackingRunLoopMode - 用于UIScrollView和别的控件的动画
        
        在我们的例子中，我们是用了NSDefaultRunLoopMode，但是不能保证动画平滑的运行，所以就可以用NSRunLoopCommonModes来替代。但是要小心，因为如果动画在一个高帧率情况下运行，你会发现一些别的类似于定时器的任务或者类似于滑动的其他iOS动画会暂停，直到动画结束。+
        
        同样可以同时对CADisplayLink指定多个run loop模式，于是我们可以同时加入NSDefaultRunLoopMode和UITrackingRunLoopMode来保证它不会被滑动打断，也不会被其他UIKit控件动画影响性能，像这样：
        self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(step:)];
        [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:UITrackingRunLoopMode];
        
        和CADisplayLink类似，NSTimer同样也可以使用不同的run loop模式配置，通过别的函数，而不是+scheduledTimerWithTimeInterval:构造器
        self.timer = [NSTimer timerWithTimeInterval:1/60.0
        target:self
        selector:@selector(step:)
        userInfo:nil
        repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:self.timer
        forMode:NSRunLoopCommonModes];
        */
        self.timer?.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSDefaultRunLoopMode)
    }
    
    func step(step: CADisplayLink) {
        let thisStep = CACurrentMediaTime()
        let stepDuration = thisStep - self.lastStep!
        self.lastStep = thisStep
        self.timeOffset = min(self.timeOffset! + stepDuration, self.duration!)
        var time = Float(self.timeOffset! / self.duration!)
        time = bounceEaseOut(time)
        let position = interpolateFromValue((self.from?.CGPointValue())!, toValue: (self.to?.CGPointValue())!, time: CGFloat(time))
        print(self.lastStep)
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
