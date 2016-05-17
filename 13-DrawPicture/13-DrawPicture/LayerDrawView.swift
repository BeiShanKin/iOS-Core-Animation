//
//  LayerDrawView.swift
//  13-DrawPicture
//
//  Created by lz on 16/5/17.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class LayerDrawView: UIView {
    
    lazy var paths: [UIBezierPath] = {
        var paths = [UIBezierPath]()
        return paths
    }()
    
    override class func layerClass() -> AnyClass {
        return CAShapeLayer.classForCoder()
    }
    
    override func awakeFromNib() {
        let shapeLayer = self.layer as? CAShapeLayer
        shapeLayer?.strokeColor = UIColor.redColor().CGColor
        shapeLayer?.fillColor = UIColor.clearColor().CGColor
        shapeLayer?.lineJoin = kCALineJoinRound
        shapeLayer?.lineCap = kCALineCapRound
        shapeLayer?.lineWidth = 5.0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let shapeLayer = self.layer as? CAShapeLayer
        shapeLayer?.strokeColor = UIColor.redColor().CGColor
        shapeLayer?.fillColor = UIColor.blueColor().CGColor
//        shapeLayer?.fillColor = UIColor.clearColor().CGColor
        shapeLayer?.lineJoin = kCALineJoinRound
        shapeLayer?.lineCap = kCALineCapRound
        shapeLayer?.lineWidth = 5.0
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        
        let path = UIBezierPath.init()
        path.lineWidth = 5.0
        path.moveToPoint(point!)
        self.paths.append(path)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        
        self.paths.last?.addLineToPoint(point!)
        let shapeLayer = self.layer as? CAShapeLayer
        shapeLayer?.path = self.paths.last?.CGPath
    }
}
