//
//  TransitionNavigationController.swift
//  08-ExplicitAnimation
//
//  Created by lz on 16/4/28.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class TransitionNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        // 获取一个Image画布
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, true, 0.0)
        // 把图层的内容绘制到当前画布上
        /**
        这里有个警告：-renderInContext:捕获了图层的图片和子图层，但是不能对子图层正确地处理变换效果，而且对视频和OpenGL内容也不起作用。但是用CATransition，或者用私有的截屏方式就没有这个限制了。
        */
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        // 把当前画布转化为一张图片
        let currentScreen = UIGraphicsGetImageFromCurrentImageContext()
        
        let screenImageView = UIImageView.init(image: currentScreen!)
        screenImageView.frame = self.view.bounds
        self.view.addSubview(screenImageView)
        
        super.pushViewController(viewController, animated: false)
        
        // 因为Push过去时控制器并没有被消灭，所以动画效果也不会消失，所以可以通过这种方法实现一种Push的过场动画效果。当然，其实还有更好的方法，不过这个方法比较简单。
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            var transform = CGAffineTransformMakeScale(0.01, 0.01)
            transform = CGAffineTransformRotate(transform, CGFloat(M_PI_2))
            screenImageView.transform = transform
            screenImageView.alpha = 0.0
            
            }) { (finished) -> Void in
                screenImageView.removeFromSuperview()
        }
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        
        
        let vc = super.popViewControllerAnimated(true)
        // 同样不推荐。。。这是也不是个好方法
//        if ((vc?.view.superview) != nil) {
//            UIView.transitionWithView(vc!.view.superview!, duration: 5.0, options: .TransitionFlipFromLeft, animations: { () -> Void in
//                super.popViewControllerAnimated(true)
//                }, completion: nil)
//        }
        // 一种动画效果（不推荐，有更好的，这个只是为了举个🌰）
        let transition = CATransition.init()
        transition.type = kCATransitionFade
//        transition.subtype = kCATransitionFromTop
        transition.duration = 1.0
        // 只要向父图层中添加了过渡动画，父图层的所有子图层都会受这个过渡动画影响
        vc!.view.superview?.layer.addAnimation(transition, forKey: nil)
        print(vc?.view.superview)
        return vc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
