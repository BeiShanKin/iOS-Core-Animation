//
//  ReplicatorViewController.swift
//  06-SpecialLayer
//
//  Created by lz on 16/4/25.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class ReplicatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let replicator = CAReplicatorLayer.init()
        replicator.backgroundColor = UIColor.redColor().CGColor
        replicator.frame = CGRect(x: 300, y: 300, width: 100, height: 100)
        replicator.position.x = self.view.bounds.size.width * 0.8
        self.view.layer.addSublayer(replicator)
        
        replicator.instanceCount = 5
        // 如果不对复制体进行变换的话，复制体将和本体完全重合，以下操作就是对复制体进行变换
        var transform = CATransform3DIdentity
//        transform = CATransform3DTranslate(transform, 0, 50, 0)
        
        // 复制体进行旋转时，旋转的中心是父图层的center。如要要进行位移，最好在旋转之前，因为旋转会对位移的方向造成影响
        transform = CATransform3DTranslate(transform, 0, 100, 0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI_2), 0, 0, 1)
        transform = CATransform3DScale(transform, -1, 1, 1)
        replicator.instanceAlphaOffset = -0.2
        // 通过Scale进行图形翻转会影响Rotate和Translate的效果
//        transform = CATransform3DRotate(transform, CGFloat(M_PI_2), 0, 0, 1)
//        transform = CATransform3DTranslate(transform, 0, 100, 0)
//        transform = CATransform3DScale(transform, 1, -1, 1)
        
        replicator.instanceTransform = transform
        
//        replicator.instanceBlueOffset = 0.1
//        replicator.instanceGreenOffset = -0.1

        
        let layer = CALayer.init()
        layer.contents = UIImage.init(named: "headerImage")?.CGImage
        layer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        layer.backgroundColor = UIColor.redColor().CGColor
        replicator.addSublayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
