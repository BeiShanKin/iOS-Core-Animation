//
//  TransitionViewController.swift
//  07-ImplicitAnimation
//
//  Created by lz on 16/4/27.
//  Copyright © 2016年 SY. All rights reserved.
//
/*
我们把改变属性时CALayer自动应用的动画称作行为，当CALayer的属性被修改时候，它会调用-actionForKey:方法，传递属性的名称。剩下的操作都在CALayer的头文件中有详细的说明，实质上是如下几步：
图层首先检测它是否有委托，并且是否实现CALayerDelegate协议指定的-actionForLayer:forKey方法。如果有，直接调用并返回结果。
如果没有委托，或者委托没有实现-actionForLayer:forKey方法，图层接着检查包含属性名称对应行为映射的actions字典。
如果actions字典没有包含对应的属性，那么图层接着在它的style字典接着搜索属性名。
最后，如果在style里面也找不到对应的行为，那么图层将会直接调用定义了每个属性的标准行为的-defaultActionForKey:方法。
所以一轮完整的搜索结束之后，-actionForKey:要么返回空（这种情况下将不会有动画发生），要么是CAAction协议对应的对象，最后CALayer拿这个结果去对先前和当前的值做动画。
*/

import UIKit

class TransitionViewController: UIViewController {

    @IBOutlet weak var layerView: UIView!
    var colorLayer: CALayer?
    @IBAction func ChangeClick(sender: UIButton) {
//        layerViewColorChange()
        layerColorChange()
    }
    
    func layerViewColorChange() {
        // 使用View中的layer进行隐式动画时，需要使用View的配到方法，不然无效。
//        print(self.layerView.actionForLayer(self.layerView.layer, forKey: "backgroundColor"))
//        CATransaction.begin()
//        let red = CGFloat(rand()) % 255 / 255.0
//        let green = CGFloat(rand()) % 255 / 255.0
//        let blue = CGFloat(rand()) % 255 / 255.0
//        CATransaction.setAnimationDuration(3.0)
//        print(self.layerView.actionForLayer(self.layerView.layer, forKey: "backgroundColor"))
//        self.layerView.layer.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).CGColor
//        CATransaction.commit()
        
        // 和单独的图层不同，View不能隐藏beginAnimations和commitAnimations，必须调用。
        print(self.layerView.actionForLayer(self.layerView.layer, forKey: "backgroundColor"))
        UIView.beginAnimations(nil, context: nil)
        let red = CGFloat(rand()) % 255 / 255.0
        let green = CGFloat(rand()) % 255 / 255.0
        let blue = CGFloat(rand()) % 255 / 255.0
        print(self.layerView.actionForLayer(self.layerView.layer, forKey: "backgroundColor"))
        UIView.setAnimationDuration(3.0)
        self.layerView.layer.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).CGColor
        UIView.commitAnimations()
    }
    
    func layerColorChange() {
        let red = CGFloat(rand()) % 255 / 255.0
        let green = CGFloat(rand()) % 255 / 255.0
        let blue = CGFloat(rand()) % 255 / 255.0
        CATransaction.setAnimationDuration(1.0)
        self.colorLayer!.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).CGColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layerView.layer.backgroundColor = UIColor.whiteColor().CGColor
        let colorLayer = CALayer.init()
        colorLayer.backgroundColor = UIColor.redColor().CGColor
        colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        var centerPoint = self.layerView.convertPoint(self.layerView.center, fromView: self.view)
        centerPoint.y -= 50
        colorLayer.position = centerPoint
        self.layerView.layer.addSublayer(colorLayer)
        self.colorLayer = colorLayer
        
        // 设置CATransition
        let transition = CATransition.init()
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromRight
        self.colorLayer?.actions = ["backgroundColor" : transition]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
