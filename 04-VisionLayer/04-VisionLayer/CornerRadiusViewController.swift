//
//  CornerRadiusViewController.swift
//  04-VisionLayer
//
//  Created by lz on 16/4/21.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class CornerRadiusViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view1.layer.cornerRadius = 10.0
        self.view1.layer.masksToBounds = true
        self.view2.layer.cornerRadius = 10.0
        // 通过和蒙版结合设置圆角
        let path = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), byRoundingCorners: [.TopLeft,.BottomRight], cornerRadii: CGSize(width: 20, height: 20))
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = self.view3.bounds
        maskLayer.path = path.CGPath
        self.view3.layer.mask = maskLayer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
