//
//  ShadowViewController.swift
//  04-VisionLayer
//
//  Created by lz on 16/4/22.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class ShadowViewController: UIViewController {

    @IBOutlet weak var snowImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置阴影的不透明度
        self.snowImageView.layer.shadowOpacity = 0.60
        // 设置阴影位移
        self.snowImageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        // 设置阴影颜色
        self.snowImageView.layer.shadowColor = UIColor.redColor().CGColor
        // 设置阴影的模糊扩散效果
        self.snowImageView.layer.shadowRadius = 10.0
        // 剪裁边框会减去图层阴影
//        self.snowImageView.clipsToBounds = true
        let path = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: 300, height: 300), cornerRadius: 150)
        // 通过CGPath可以设置阴影轮廓，而不使用layer的轮廓
        self.snowImageView.layer.shadowPath = path.CGPath
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
