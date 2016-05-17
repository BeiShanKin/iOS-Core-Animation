//
//  DrawView.swift
//  13-DrawPicture
//
//  Created by lz on 16/5/17.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class DrawView: UIView {
//    lazy var path: UIBezierPath = {
//        let path = UIBezierPath.init()
//        path.lineWidth = 5.0
//        path.lineJoinStyle = .Round
//        return path
//    }()
    
    var path: UIBezierPath?
    
    lazy var paths: [UIBezierPath] = {
        var paths = [UIBezierPath]()
        return paths
    }()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        
        let path = UIBezierPath.init()
        path.lineWidth = 5.0
        path.lineJoinStyle = .Round
        path.moveToPoint(point!)
        self.paths.append(path)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        self.paths.last?.addLineToPoint(point!)
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        for (var i = 0; i < self.paths.count; i++ ) {
            let path = self.paths[i]
            UIColor.redColor().setStroke()
            UIColor.clearColor().setFill()
            path.stroke()
        }
    }
}
