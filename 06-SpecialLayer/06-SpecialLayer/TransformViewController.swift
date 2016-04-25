//
//  TransformViewController.swift
//  06-SpecialLayer
//
//  Created by lz on 16/4/23.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {

    var cube1: CALayer?
    var cube2: CALayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pt = CATransform3DIdentity
        pt.m34 = -1 / 500
        self.view.layer.sublayerTransform = pt
        
        var c1t = CATransform3DIdentity
        c1t = CATransform3DTranslate(c1t, -100, 0, 0)
        c1t = CATransform3DRotate(c1t, CGFloat(M_PI_4), 1, 1, 0)
        let cube1 = cubeWithTransform(c1t)
        self.cube1 = cube1
        self.view.layer.addSublayer(cube1)
        
        var c2t = CATransform3DIdentity
        c2t = CATransform3DTranslate(c2t, 100, 100, 0)
        c2t = CATransform3DRotate(c2t, CGFloat(M_PI), 1, 0, 1)
        let cube2 = cubeWithTransform(c2t)
        self.cube2 = cube2
        self.view.layer.addSublayer(cube2)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        var c1t = self.cube1!.transform
        c1t = CATransform3DRotate(c1t, CGFloat(M_PI_4), 1, 1, 0)
        UIView.animateWithDuration(2.0) { () -> Void in
            self.cube1?.transform = c1t
        }
        
        var c2t = self.cube2!.transform
        c2t = CATransform3DRotate(c2t, CGFloat(-M_PI_2), 1, 1, 0)
        UIView.animateWithDuration(2.0) { () -> Void in
            self.cube2?.transform = c2t
        }
    }
    
    func faceWithTransform(transform: CATransform3D) -> CALayer {
        // 每一个面都是CALayer
        let face = CALayer.init()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        
        let red = CGFloat(rand()) % 255 / 255.0
        let green = CGFloat(rand()) % 255 / 255.0
        let blue = CGFloat(rand()) % 255 / 255.0
        print(red,green,blue,INT_MAX)
        face.backgroundColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0).CGColor
        
        face.transform = transform
        return face
    }
    
    func cubeWithTransform(transform: CATransform3D) -> CALayer {
        // 用来装“面”的载体是CATransformLayer，CATransformLayer本身并不显示，不过却可以通过控制CATransformLayer的transform来调整立方体的位置
        let cube = CATransformLayer.init()
        
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(faceWithTransform(ct))
        
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(M_PI_2), 0, 1, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, CGFloat(M_PI_2), 1, 0, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, CGFloat(-M_PI_2), 1, 0, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(-M_PI_2), 0, 1, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, CGFloat(M_PI), 0, 1, 0)
        cube.addSublayer(faceWithTransform(ct))
        
        let contentSize = self.view.bounds.size
        cube.position = CGPointMake(contentSize.width * 0.5, contentSize.height * 0.5)
        cube.transform = transform
        
        return cube
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
