//
//  TimeLineViewController.swift
//  10-CAMedia
//
//  Created by lz on 16/5/4.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TimeLine"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let tf = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
//        let tf = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseIn)
//        let tf = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
//        let tf = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
//        let tf = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionDefault)
        let tf = CAMediaTimingFunction.init(controlPoints: 1, 0, 0.75, 1)
        let point1 = UnsafeMutablePointer<Float>.alloc(2)
        let point2 = UnsafeMutablePointer<Float>.alloc(2)
        tf.getControlPointAtIndex(1, values: point1)
        tf.getControlPointAtIndex(2, values: point2)
        print(point1[1],point2[1])
        let layer = CAShapeLayer.init()
        layer.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        layer.position = self.view.center
        layer.backgroundColor = UIColor.grayColor().CGColor
        let path = UIBezierPath.init()
        path.moveToPoint(CGPointZero)
        let controlPoint1 = CGPoint(x: CGFloat(point1[0]), y: CGFloat(point1[1]))
        let controlPoint2 = CGPoint(x: CGFloat(point2[0]), y: CGFloat(point2[0]))
        path.addCurveToPoint(CGPoint(x: 1, y: 1), controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        path.applyTransform(CGAffineTransformMakeScale(300, 300))
        layer.path = path.CGPath
        layer.lineWidth = 3.0
        layer.lineCap = kCALineCapRound
        layer.strokeColor = UIColor.redColor().CGColor
        layer.fillColor = UIColor.whiteColor().CGColor
        layer.geometryFlipped = true
        view.layer.addSublayer(layer)
        point1.dealloc(2)
        point2.dealloc(2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
