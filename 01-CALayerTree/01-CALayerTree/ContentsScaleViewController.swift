//
//  ContentsScaleViewController.swift
//  01-CALayerTree
//
//  Created by lz on 16/4/20.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class ContentsScaleViewController: UIViewController {
    var layerView: UIView?
    @IBAction func gravityClick(sender: UIButton) {
        // 当显示发生编程kCAGravityCenter，此时不会再拉伸图片，因为图片的contentsScale是1，所以图片会超出范围
        self.layerView!.layer.contentsGravity = kCAGravityCenter
    }
    @IBAction func scaleClick(sender: UIButton) {
        // 通过改变contentsScale可以改变图片显示时的‘大小’,但是前提是图片不被拉伸处理
        self.layerView!.layer.contentsScale = 2.0
    }
    @IBAction func contentsRectClick(sender: UIButton) {
        // 只显示图片的一部分
        self.layerView?.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.5, height: 0.5)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.contents = UIImage.init(named: "Snowman")?.CGImage
        // 默认使用的显示方式是拉伸图片的，此时contentsScale的作用无法发挥。
        view.backgroundColor = UIColor.blueColor()
        view.center = self.view.center
        self.layerView = view
        self.view.addSubview(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
