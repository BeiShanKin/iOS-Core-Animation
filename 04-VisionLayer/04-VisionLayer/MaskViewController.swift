//
//  MaskViewController.swift
//  04-VisionLayer
//
//  Created by lz on 16/4/22.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class MaskViewController: UIViewController {

    @IBOutlet weak var coneImageView: UIImageView!
    @IBOutlet weak var lglooImageView: UIImageView!
    @IBOutlet weak var snowImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let lglooLayer = CALayer.init()
        lglooLayer.contents = UIImage.init(named: "Igloo")?.CGImage
        
        let coneLayer = CALayer.init()
        coneLayer.contents = UIImage.init(named: "Cone")?.CGImage
        
//        lglooLayer.frame = self.coneImageView.bounds
//        coneLayer.frame = self.lglooImageView.bounds
        
        lglooLayer.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        coneLayer.frame = self.lglooImageView.bounds
        
        // 超过蒙板的区域会被减除
        self.coneImageView.layer.mask = lglooLayer
        self.lglooImageView.layer.mask = coneLayer
        
        
        
//        coneLayer.frame = self.snowImageView.bounds
//        self.snowImageView.layer.mask = coneLayer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
