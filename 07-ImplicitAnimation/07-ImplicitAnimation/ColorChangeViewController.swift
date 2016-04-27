//
//  ColorChangeViewController.swift
//  07-ImplicitAnimation
//
//  Created by lz on 16/4/26.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class ColorChangeViewController: UIViewController {

    var colorLayer: CALayer?
    @IBAction func colorChangeClick(sender: UIButton) {
        //CATransaction.begin() 和 CATransaction.commit()可以不用（要用就要成对出现），仅仅使用 CATransaction.setAnimationDuration(5.0)来设置时间
//        CATransaction.begin()
        CATransaction.setAnimationDuration(5.0)
        
        CATransaction.setCompletionBlock { () -> Void in
            // 如果这里不设置时间，会使用默认的0.25s。这是因为完成块是在颜色渐变的事务提交并出栈之后才被执行，于是，用默认的事务做变换，默认的时间也就变成了0.25秒
//            CATransaction.setAnimationDuration(1.0)
            self.colorLayer?.opacity = 0.1
        }
        
        self.colorLayer?.backgroundColor = UIColor.blueColor().CGColor
        //setCompletionBlock一定要在改变颜色前面调用，不然就会在颜色改变之前就调用了。
//        CATransaction.setCompletionBlock { () -> Void in
//            CATransaction.setAnimationDuration(1.0)
//            self.colorLayer?.opacity = 0.1
//        }
        
//        CATransaction.commit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLayer = CALayer.init()
        colorLayer?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        colorLayer?.position = self.view.center
        colorLayer?.position.y -= 50
        colorLayer?.backgroundColor = UIColor.redColor().CGColor
        self.view.layer.addSublayer(colorLayer!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
