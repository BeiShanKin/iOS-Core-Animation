//
//  DrawView.swift
//  01-CALayerTree
//
//  Created by lz on 16/4/20.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class DrawView: UIView {
    // 如果不需要使用drawRect，就不要实现它，不然会造成性能消耗。如果实现了layer的代理，那么就不会调用该方法啦。
    override func drawRect(rect: CGRect) {
        self.drawImage()
    }
    
//     如果实现了这个方法，那么view就不会调用drawRect，而只会调用这个方法
//    override func displayLayer(layer: CALayer) {
//        layer.contents = UIImage.init(named: "Snowman")?.CGImage
//        print("我是displayLayer，我被调用了吗？")
//    }

    // 如果没有实现displayLayer，就会调用这个方法
//    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
//        CGContextSetLineWidth(ctx, 9.0)
//        CGContextSetStrokeColorWithColor(ctx, UIColor.blackColor().CGColor)
//        CGContextStrokeEllipseInRect(ctx, layer.bounds)
//        print("我是drawLayerinContext，我被调用了吗？")
//    }
    
    func drawCirCle() {
        let path = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: self.bounds.size.height * 0.5)
        path.lineWidth = 20.0
        UIColor.whiteColor().set()
        path.stroke()
        // 会被调用两次。第一次被调用时第一次出现时，第二次被调用是改变自身背景颜色时。
        print("bezier.我被调用了几次？我是重回哦")
    }
    
    func drawImage() {
        // 当需要在图层上添加图片的同时进行绘画时，就要使用这种方式。
        let image = UIImage.init(named: "Snowman")
        image?.drawInRect(self.bounds)
        self.drawCirCle()
        print("image.我被调用了几次？我是重回哦")
    }

}
