//
//  ShapeViewController.swift
//  06-SpecialLayer
//
//  Created by lz on 16/4/22.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class ShapeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        drawBezier()
    }
    
    func drawBezier() {
        let shapeLayer = CAShapeLayer.init()
        // red区域是shapeLayer的frame区域
        shapeLayer.backgroundColor = UIColor.redColor().CGColor
        // shapeLayer默认是没有宽高的，如果开启剪裁就会什么都不剩，但是绘制的部分可以超出frame的范围渲染，用来做蒙板时，起到蒙版作用的是layer渲染出来的部分
        //        shapeLayer.masksToBounds = true
        let path = UIBezierPath.init()
        print(shapeLayer.position)
        path.addArcWithCenter(CGPoint(x: 100,y: 100), radius: 100, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        path.moveToPoint(CGPoint(x: 0,y: 0))
        path.addLineToPoint(CGPoint(x: 100, y: 100))
        shapeLayer.strokeColor = UIColor.blueColor().CGColor
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.lineWidth = 10.0
        shapeLayer.frame = CGRect(x: 10.0, y: 100.0, width: 100, height: 100)
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = UIColor.blackColor().CGColor
        self.view.layer.addSublayer(shapeLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
