//
//  PanAnimationViewController.swift
//  09-MediaTiming
//
//  Created by lz on 16/4/29.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class PanAnimationViewController: UIViewController {

    @IBOutlet weak var doorImageView: UIImageView!
    @IBAction func pan(sender: UIPanGestureRecognizer) {
        // 在视图坐标系中沿x轴滑动了多少的距离
        var x = sender.translationInView(self.view).x
        print("x ------- \(x)")
        // 延长滑动的距离
        x /= 20.0
        var timeOffset = doorImageView.layer.timeOffset
        // 设置滑动效果的范围，大于0.0，小于9.999，在Duration的范围内
        timeOffset = min(9.999,max(0.0,timeOffset - Double(x)))
        doorImageView.layer.timeOffset = timeOffset
        // 因为拖动起来一直是在递增，所以每次都要用setTranslation:方法制0这样才不至于不受控制般滑动出视图
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doorImageView.layer.anchorPoint = CGPoint(x: 0.0, y: 0.5)
        doorImageView.layer.transform.m34 = -1 / 500
        doorImageView.layer.speed = 0.0
        let animation = CABasicAnimation.init()
        animation.keyPath = "transform.rotation.y"
        animation.toValue = -M_PI_2 * 1.5
        animation.duration = 10.0
        doorImageView.layer.addAnimation(animation, forKey: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
