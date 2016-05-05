//
//  GravityViewController.swift
//  11-FrameAnimation
//
//  Created by lz on 16/5/5.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {

    var animator: UIDynamicAnimator?
    var collision: UICollisionBehavior?
    var gravity: UIGravityBehavior?
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView.init(image: UIImage.init(named: "Crate"))
        imageView.center.x = self.view.center.x
        imageView.center.y += (self.navigationController?.navigationBar.bounds.size.height)! + 20
        self.view.addSubview(imageView)
        imageView.layer.cornerRadius = imageView.bounds.size.width * 0.5
        imageView.clipsToBounds = true
        self.animator = UIDynamicAnimator.init(referenceView: self.view)
        let gravity = UIGravityBehavior.init()
        gravity.magnitude = 10.1
        gravity.addItem(imageView)
        let collision = UICollisionBehavior.init()
        self.gravity = gravity
        collision.addItem(imageView)
        // 添加从点到点的边界
        collision.addBoundaryWithIdentifier("bounry", fromPoint: CGPoint(x: self.view.bounds.size.width, y: 400), toPoint: CGPoint(x: 0, y: 400))
//        collision.collisionMode = .Boundaries
        self.collision = collision
        self.animator!.addBehavior(gravity)
        self.animator!.addBehavior(collision)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.collision?.removeAllBoundaries()
        // 设置屏幕为边界
//        self.collision!.translatesReferenceBoundsIntoBoundary = true
        self.gravity?.magnitude = 100
        
        let path = UIBezierPath.init()
        path.addArcWithCenter(self.view.center, radius: 300, startAngle: 0, endAngle:CGFloat(M_PI * 2), clockwise: false)
        let shapeLayer = CAShapeLayer.init()
        shapeLayer.frame = CGRect(x: 0, y: 0, width: 600, height: 600)
        shapeLayer.position = self.view.center
        shapeLayer.strokeColor = UIColor.blueColor().CGColor
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.path = path.CGPath
        self.view.layer.addSublayer(shapeLayer)
        self.collision?.addBoundaryWithIdentifier("pathBoundary", forPath: path)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
