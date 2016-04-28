//
//  PropertyViewController.swift
//  08-ExplicitAnimation
//
//  Created by lz on 16/4/27.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class PropertyViewController: UIViewController {

    var colorLayer: CALayer?
    
    @IBOutlet weak var contianerView: UIView!
    
    @IBAction func changeClick(sender: UIButton) {
        let red = CGFloat(rand()) % 255 / 255.0
        let green = CGFloat(rand()) % 255 / 255.0
        let blue = CGFloat(rand()) % 255 / 255.0
        let color = UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
        let animation = CABasicAnimation.init()
        animation.keyPath = "backgroundColor"
        animation.toValue = color.CGColor
        animation.delegate = self
        animation.duration = 3.0
        self.colorLayer?.addAnimation(animation, forKey: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorLayer = CALayer.init()
        colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        colorLayer.position = self.contianerView.convertPoint(self.contianerView.center, fromView: self.view)
        colorLayer.backgroundColor = UIColor.blueColor().CGColor
        self.contianerView.layer.addSublayer(colorLayer)
        self.colorLayer = colorLayer
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        let animation = anim as! CABasicAnimation
        self.colorLayer?.backgroundColor = animation.toValue! as! CGColor
        print(animation)
        CATransaction.commit()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
