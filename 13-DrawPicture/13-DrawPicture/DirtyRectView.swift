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
        self.setNeedsDisplayInRect((self.rects.last?.CGRectValue())!)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        self.rects.append(getRect(point!))
        // 全局重绘（fps会随着重绘量的增加而降低）
//        self.setNeedsDisplay()
        // 指定区域重绘（fps可以一直稳定在60）
        self.setNeedsDisplayInRect((self.rects.last?.CGRectValue())!)
    }
    
    func getRect(point: CGPoint) -> NSValue {
        return NSValue.init(CGRect: CGRect(x: point.x - self.image.size.width * 0.5, y: point.y - self.image.size.height * 0.5, width: self.image.size.width, height: self.image.size.height))
    }
    
    override func drawRect(rect: CGRect) {
        for i in 0..<self.rects.count {
            let frame = self.rects[i].CGRectValue()
            // 判断两个矩形是否有交集
            if (CGRectIntersectsRect(rect, frame)) {
                self.image.drawInRect(frame)
            }
        }
    }
}
