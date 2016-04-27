//
//  ShowTreeViewController.swift
//  07-ImplicitAnimation
//
//  Created by lz on 16/4/27.
//  Copyright © 2016年 SY. All rights reserved.
//

/*  写的挺好，我就全Copy过来啦
当你改变一个图层的属性，属性值的确是立刻更新的（如果你读取它的数据，你会发现它的值在你设置它的那一刻就已经生效了），但是屏幕上并没有马上发生改变。这是因为你设置的属性并没有直接调整图层的外观，相反，他只是定义了图层动画结束之后将要变化的外观。
当设置CALayer的属性，实际上是在定义当前事务结束之后图层如何显示的模型。Core Animation扮演了一个控制器的角色，并且负责根据图层行为和事务设置去不断更新视图的这些属性在屏幕上的状态。
我们讨论的就是一个典型的微型MVC模式。CALayer是一个连接用户界面（就是MVC中的view）虚构的类，但是在界面本身这个场景下，CALayer的行为更像是存储了视图如何显示和动画的数据模型。实际上，在苹果自己的文档中，图层树通常都是值的图层树模型。
在iOS中，屏幕每秒钟重绘60次。如果动画时长比60分之一秒要长，Core Animation就需要在设置一次新值和新值生效之间，对屏幕上的图层进行重新组织。这意味着CALayer除了“真实”值（就是你设置的值）之外，必须要知道当前显示在屏幕上的属性值的记录。
每个图层属性的显示值都被存储在一个叫做呈现图层的独立图层当中，他可以通过-presentationLayer方法来访问。这个呈现图层实际上是模型图层的复制，但是它的属性值代表了在任何指定时刻当前外观效果。换句话说，你可以通过呈现图层的值来获取当前屏幕上真正显示出来的值（图7.4）。
我们在第一章中提到除了图层树，另外还有呈现树。呈现树通过图层树中所有图层的呈现图层所形成。注意呈现图层仅仅当图层首次被提交（就是首次第一次在屏幕上显示）的时候创建，所以在那之前调用-presentationLayer将会返回nil。
你可能注意到有一个叫做–modelLayer的方法。在呈现图层上调用–modelLayer将会返回它正在呈现所依赖的CALayer。通常在一个图层上调用-modelLayer会返回–self（实际上我们已经创建的原始图层就是一种数据模型）。
*/

import UIKit

class ShowTreeViewController: UIViewController {

    var showLayer: CALayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        let showLayer = CALayer.init()
        showLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        showLayer.position = self.view.center
        showLayer.backgroundColor = UIColor.whiteColor().CGColor
        self.view.layer.addSublayer(showLayer)
        self.showLayer = showLayer
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchPoint = touch?.locationInView(self.view)
        if ((self.showLayer?.presentationLayer()!.hitTest(touchPoint!)) != nil) {
            print("In");
            let red = CGFloat(rand()) % 255 / 255.0
            let green = CGFloat(rand()) % 255 / 255.0
            let blue = CGFloat(rand()) % 255 / 255.0
            CATransaction.setAnimationDuration(1.0)
            self.showLayer!.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).CGColor
        } else {
            print("Out");
            CATransaction.setAnimationDuration(5.0)
            self.showLayer?.position = touchPoint!
        }
        
        // 如果没有用presentationLayer（呈现中），自己体会一下
//        let touch = touches.first
//        let touchPoint = touch?.locationInView(self.view)
//        if ((self.showLayer?.hitTest(touchPoint!)) != nil) {
//            print("In");
//            let red = CGFloat(rand()) % 255 / 255.0
//            let green = CGFloat(rand()) % 255 / 255.0
//            let blue = CGFloat(rand()) % 255 / 255.0
//            CATransaction.setAnimationDuration(1.0)
//            self.showLayer!.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).CGColor
//        } else {
//            print("Out");
//            CATransaction.setAnimationDuration(5.0)
//            self.showLayer?.position = touchPoint!
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
