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
//        CATransaction.begin()
        CATransaction.setAnimationDuration(5.0)
        self.colorLayer?.backgroundColor = UIColor.blueColor().CGColor
        self.colorLayer?.opacity = 0.1
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
