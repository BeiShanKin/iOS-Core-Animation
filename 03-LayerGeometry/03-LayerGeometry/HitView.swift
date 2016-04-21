//
//  HitView.swift
//  03-LayerGeometry
//
//  Created by lz on 16/4/21.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

@IBDesignable class HitView: UIView {

    @IBInspectable var cornorRadius:CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornorRadius
            self.layer.borderColor = UIColor.blackColor().CGColor
            self.layer.borderWidth = 10.0
            self.layer.masksToBounds = cornorRadius > 0.0
        }
    }
    // 当图层的bounds发生改变，或者图层的-setNeedsLayout方法被调用的时候，这个函数将会被执行。这使得你可以手动地重新摆放或者重新调整子图层的大小，但是不能像UIView的autoresizingMask和constraints属性做到自适应屏幕旋转。这也是为什么最好使用视图而不是单独的图层来构建应用程序的另一个重要原因之一。
//    override func layoutSublayersOfLayer(layer: CALayer) {
//        self.layer.position = CGPoint(x: 0,y: 0)
//    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("我被点击啦。")
        let radii = self.bounds.width * 0.5
        let touchPoint = touches.first?.locationInView(self);
        let distance1 = touchPoint!.x - radii
        let distance2 = touchPoint!.y - radii
        // layer也是按照frame来检测点是否在自己内
        if (self.layer.containsPoint(touchPoint!)) {
            print(touchPoint)
        } else {
            print("不在！")
        }

        if ((distance1 * distance1 + distance2 * distance2) < radii * radii) {
            print("在圆里吧 \(touchPoint)")
        } else {
            print("不在圆里！")
        }
        
        let point = self.layer.convertPoint(touchPoint!, toLayer: self.superview?.layer)
        // 这个方法可以同样检测的范围也是frame的范围，但是接受的point不需要进行那么复杂的转换，只需要拿到控制器的view中point就行
        let currentLayer = self.layer.hitTest(point)
        print("point ----------\(point) layer ----- \(currentLayer?.frame)")
    }
}
