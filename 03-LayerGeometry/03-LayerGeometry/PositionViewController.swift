//
//  PositionViewController.swift
//  03-LayerGeometry
//
//  Created by lz on 16/4/21.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class PositionViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var whiteView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // zPosition默认为0，大于0的话就会在前面，小于0的话会在后面，但是改变的只是看起来的效果，而不改变在父视图中的层级关系
        self.orangeView.layer.zPosition = 1.0
        self.yellowView.layer.zPosition = -1.0
        print("zPosition --- \(self.yellowView.layer.zPosition)")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touchPoint = touches.first?.locationInView(self.orangeView)
        print("x \(touchPoint?.x) y \(touchPoint?.y)")
        //self.orangeView 中的点 touchPoint 在self.view 中的位置
        var point = self.orangeView.convertPoint(touchPoint!, toView: self.view);
        print("view.x \(point.x) view.y \(point.y)")
        //self.orangeView 中的点 touchPoint 在self.view 中的位置
        point = self.view.convertPoint(touchPoint!, fromView: self.orangeView)
        print("x \(point.x) y \(point.y)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
