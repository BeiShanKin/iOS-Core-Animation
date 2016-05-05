//
//  TimerViewController.swift
//  11-FrameAnimation
//
//  Created by lz on 16/5/5.
//  Copyright © 2016年 SY. All rights reserved.
//

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
