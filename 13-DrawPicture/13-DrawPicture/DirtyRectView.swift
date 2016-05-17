//
//  DirtyRectView.swift
//  13-DrawPicture
//
//  Created by lz on 16/5/17.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class DirtyRectView: UIView {
    
    lazy var image: UIImage = {
        let image = UIImage.init(named: "Chalk")
        return image!
    }()
    
    lazy var rects: [NSValue] = {
        var rects = [NSValue]()
        return rects
    }()
    
    override func awakeFromNib() {
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        self.rects.append(getRect(point!))
        self.setNeedsDisplay()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        self.rects.append(getRect(point!))
        self.setNeedsDisplay()
    }
    
    func getRect(point: CGPoint) -> NSValue {
        return NSValue.init(CGRect: CGRect(x: point.x - self.image.size.width * 0.5, y: point.y - self.image.size.height * 0.5, width: self.image.size.width, height: self.image.size.height))
    }
    
    override func drawRect(rect: CGRect) {
        for i in 0..<self.rects.count {
            let rect = self.rects[i].CGRectValue()
            self.image.drawInRect(rect)
        }
    }
}
