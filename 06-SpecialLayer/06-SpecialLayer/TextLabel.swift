//
//  TextLabel.swift
//  06-SpecialLayer
//
//  Created by lz on 16/4/22.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class TextLabel: UILabel {
    override var text: String? {
        didSet {
            let textLayer = self.layer as? CATextLayer
            textLayer?.string = text
        }
    }
    
    override var attributedText: NSAttributedString? {
        didSet {
            let textLayer = self.layer as? CATextLayer
            self.layer.frame = self.bounds
            textLayer?.string = text
        }
    }
    
//    init(frame: CGRect) {
////        self.frame = frame
//    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override class func layerClass() -> AnyClass {
        return CATextLayer.self
    }
}
