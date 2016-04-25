//
//  Transform3DViewController.swift
//  05-LayerTransform
//
//  Created by lz on 16/4/24.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class Transform3DViewController: UIViewController {

    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    @IBAction func btnClick(sender: UIButton) {
        print("按钮被点击了")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.touchFun3()
    }
    
    func touchFunc1() {
        // 是否渲染背面
//        self.btn.layer.doubleSided = false
        var transform3D = self.btn.layer.transform
        print("origin ------ \(transform3D)")
        //        transform3D = CATransform3DMakeScale(4.0, 4.0, 0.0)
        //        print("Scale ------ \(transform3D)")
        //        transform3D = CATransform3DMakeTranslation(100, 100, 100)
        //        print("Translation ------ \(transform3D)")
        // 用来设置透视效果，通过手动设置m34可以控制透视效果，不过m34必须在进行变换之前设置，同时，设置完以后要用不带Make的变换，因为Make变换是在transform上进行的
        transform3D.m34 = -1 / 300   // m34的值一般都在-1/500 --- -1/1000之间
        transform3D = CATransform3DRotate(transform3D,CGFloat(radiansToDegrees(45)), 0, 1, 0)
        print("Rotation ------ \(transform3D)")
        UIView.animateWithDuration(2.0) { () -> Void in
            self.btn.layer.contentsScale = UIScreen .mainScreen().scale
            self.btn.layer.transform = transform3D
        }
    }
    
    func touchFun2() {
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        // 同意设置子图层的transform透视效果
        self.containerView.layer.sublayerTransform = transform
        
        transform = CATransform3DIdentity
        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(45)), 0, 1, 0)
        self.btnLeft.layer.transform = transform
        
        transform = CATransform3DIdentity
        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(-45)), 0, 1, 0)
        self.btnRight.layer.transform = transform
        
    }
    
    func touchFun3() {
        // 平面旋转可以互相抵消
//        self.whiteView.layer.contents = UIImage.init(named: "Snowman")?.CGImage
//        var transform = CATransform3DIdentity
//        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(45)), 0, 0, 1)
//        UIView.animateWithDuration(2.0) { () -> Void in
//            self.whiteView.layer.transform = transform
//        }
//        
//        transform = CATransform3DIdentity
//        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(45)), 0, 0, -1)
//        
//        UIView.animateWithDuration(2.0) { () -> Void in
//            self.grayView.layer.transform = transform
//        }
        
        // 效果同上
//        self.whiteView.layer.contents = UIImage.init(named: "Snowman")?.CGImage
//        var transform = CATransform3DIdentity
//        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(-45)), 0, 0, 1)
//        UIView.animateWithDuration(2.0) { () -> Void in
//            self.whiteView.layer.transform = transform
//        }
//        
//        transform = CATransform3DIdentity
//        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(45)), 0, 0, 1)
//        
//        UIView.animateWithDuration(2.0) { () -> Void in
//            self.grayView.layer.transform = transform
//        }
        
        //X轴，Y轴变幻无法抵消
//        self.whiteView.layer.contents = UIImage.init(named: "Snowman")?.CGImage
//        var transform = CATransform3DIdentity
//        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(45)), 0, -1, 0)
//        UIView.animateWithDuration(2.0) { () -> Void in
//            self.whiteView.layer.transform = transform
//        }
//        
//        transform = CATransform3DIdentity
//        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(45)), 0, 1, 0)
//        
//        UIView.animateWithDuration(2.0) { () -> Void in
//            self.grayView.layer.transform = transform
//        }
        
        self.whiteView.layer.contents = UIImage.init(named: "Snowman")?.CGImage
        var transform = CATransform3DIdentity
        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(45)), 1, 0, 0)
        UIView.animateWithDuration(2.0) { () -> Void in
            self.whiteView.layer.transform = transform
        }
        
        transform = CATransform3DIdentity
        transform = CATransform3DRotate(transform, CGFloat(radiansToDegrees(45)), -1, 0, 0)
        
        UIView.animateWithDuration(2.0) { () -> Void in
            self.grayView.layer.transform = transform
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
