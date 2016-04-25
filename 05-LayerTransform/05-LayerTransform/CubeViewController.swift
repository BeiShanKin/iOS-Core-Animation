//
//  CubeViewController.swift
//  05-LayerTransform
//
//  Created by lz on 16/4/25.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class CubeViewController: UIViewController {

    var faces: [UIView]?
    @IBOutlet weak var containerView: UIView!
    @IBAction func btnClick(sender: UIButton) {
        print("点击了")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        faces = NSBundle.mainBundle().loadNibNamed("Cube", owner: nil, options: nil) as? [UIView]
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1 / 500.0
        perspective = CATransform3DRotate(perspective, CGFloat(-M_PI_4), 1, 0, 0)
        perspective = CATransform3DRotate(perspective, CGFloat(-M_PI_4), 0, 1, 0)
        self.containerView.layer.sublayerTransform = perspective
        
        var transform = CATransform3DMakeTranslation(0, 0, 100)
        addFaceWithTransform(0, transform: transform)
        
        transform = CATransform3DMakeTranslation(100, 0, 0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI_2), 0, 1, 0)
        addFaceWithTransform(1, transform: transform)
        
        transform = CATransform3DMakeTranslation(0, -100, 0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI_2), 1, 0, 0)
        addFaceWithTransform(2, transform: transform)
        
        transform = CATransform3DMakeTranslation(0, 100, 0);
        transform = CATransform3DRotate(transform, CGFloat(-M_PI_2), 1, 0, 0);
        addFaceWithTransform(3, transform: transform)
        
        transform = CATransform3DMakeTranslation(-100, 0, 0);
        transform = CATransform3DRotate(transform, CGFloat(-M_PI_2), 0, 1, 0);
        addFaceWithTransform(4, transform: transform)
        
        transform = CATransform3DMakeTranslation(0, 0, -100);
        transform = CATransform3DRotate(transform, CGFloat(M_PI), 0, 1, 0);
        addFaceWithTransform(5, transform: transform)
    }
    
    func addFaceWithTransform(index:Int,transform: CATransform3D) {
        let face = self.faces![index];
        print(face)
        if (index != 3) {
            face.userInteractionEnabled = false
        }
        face.layer.borderColor = UIColor.blackColor().CGColor
        face.layer.borderWidth = 1.0
        self.containerView.addSubview(face)
        let containerSize = self.containerView.bounds.size
        face.center = CGPoint(x: containerSize.width * 0.5, y: containerSize.height * 0.5)
        face.layer.transform = transform
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        var transform = self.containerView.layer.transform
//        transform = CATransform3DRotate(transform, CGFloat(M_PI_4), 1, 1, 0)
//        UIView.animateWithDuration(2.0) { () -> Void in
//            self.containerView.layer.transform = transform
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
