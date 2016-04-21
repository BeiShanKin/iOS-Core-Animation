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
