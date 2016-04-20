//
//  DrawViewController.swift
//  01-CALayerTree
//
//  Created by lz on 16/4/20.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    var drawView: UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        let drawView = DrawView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        drawView.backgroundColor = UIColor.blueColor()
        drawView.center = view.center
        drawView.contentScaleFactor = 3.0
        // 如果不设置代理，那么默认的代理就是视图本身
//        drawView.layer.delegate = drawView
        self.drawView = drawView
        self.view.addSubview(drawView)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 给图层设置contents时，会重新渲染，消除原有的渲染
//        self.drawView?.layer.contents = UIImage.init(named: "Snowman")?.CGImage
        // 给图层设置背景色时，也会重新渲染，消除原有的渲染，但是当需要重新渲染的部分和原来相同时，就不会渲染啦。
//        self.drawView?.backgroundColor = UIColor.greenColor()
        // 当图层不再渲染时，可以使用setNeedsDisplay方法让图层进行强制渲染
//        self.drawView?.setNeedsDisplay()
        
        // 当视图的一些会影响显示效果的属性被更改时，也会强制渲染。
//        let frame = self.drawView?.frame
//        self.drawView?.frame = CGRectMake((frame?.origin.x)!, (frame?.origin.y)!, (frame?.size.width)! - 20, (frame?.size.height)! - 20)
        
//        self.drawView?.layer.display()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
