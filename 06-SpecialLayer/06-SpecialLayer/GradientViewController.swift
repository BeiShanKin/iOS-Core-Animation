//
//  GradientViewController.swift
//  06-SpecialLayer
//
//  Created by lz on 16/4/25.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class GradientViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer.init()
        gradient.frame = self.containerView.bounds
        self.containerView.layer.addSublayer(gradient)
        // 默认情况下colors中的颜色是均匀分布的，但是可以通过locations数组设置，到locations的元素数量大时，超出部分不适用，当locations元素数量少时，缺少部分的颜色不显示，早起版本可能会出现空白情况。
        gradient.colors = [UIColor.redColor().CGColor,UIColor.blueColor().CGColor,UIColor.grayColor().CGColor, UIColor.greenColor().CGColor,UIColor.yellowColor().CGColor]
        gradient.locations = [0.0,0.2,0.4,0.6,0.8,0.5]
        gradient.startPoint = CGPoint(x: 0.0,y: 0.4)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
