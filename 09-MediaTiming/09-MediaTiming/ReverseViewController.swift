//
//  ReverseViewController.swift
//  09-MediaTiming
//
//  Created by lz on 16/4/29.
//  Copyright © 2016年 SY. All rights reserved.
//
/*
和beginTime不同的是，timeOffset并不受speed的影响。所以如果你把speed设为2.0，把timeOffset设置为0.5，那么你的动画将从动画最后结束的地方开始，因为1秒的动画实际上被缩短到了0.5秒。然而即使使用了timeOffset让动画从结束的地方开始，它仍然播放了一个完整的时长，这个动画仅仅是循环了一圈，然后从头开始播放。
*/

import UIKit

class ReverseViewController: UIViewController {
    
    var layer: CALayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CALayer.init()
        layer.contents = UIImage.init(named: "Door")?.CGImage
        layer.frame = CGRect(x: 0, y: 0, width: 128, height: 256)
        layer.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        layer.position = self.view.center
        layer.transform.m34 = -1 / 500
        self.layer = layer
        self.view.layer.addSublayer(layer)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.layer?.removeAllAnimations()
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
            let animation = CABasicAnimation.init()
            // 用来刷新动画结束后图层的显示状态的
//            animation.fillMode = kCAFillModeBoth
//            animation.removedOnCompletion = false
            
            // 通过.y可以决定旋转围绕哪个轴上的
            animation.keyPath = "transform.rotation.y"
            animation.toValue = -M_PI * 0.75
            // 这个属性还没研究明白
//            animation.beginTime = 0.5
            // 把动画的起点移动到 timeOffset / duration 的位置，然后运行，timeOffset之前的部分会被接到动画的最后，展示的仍是一个完整的周期，本身不受timeOffset的影响，但是动画过程会被speed加速。
            animation.timeOffset = 1.0
            
            // 决定动画效果的速度，默认是1.0 如果设置了无限循环，那么加速度执行完动画后不会等，而回直接开始下一次动画，效果等同 duration 变成了 duration / speed
            animation.speed = 2.0
            
//            animation.repeatCount = Float.infinity
            animation.duration = 2.0
    
            // 设置了autoreverses属性后，duration消耗的时间会翻倍
//            animation.autoreverses = true
            self.layer?.addAnimation(animation, forKey: nil)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
