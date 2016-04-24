//
//  TextViewController.swift
//  06-SpecialLayer
//
//  Created by lz on 16/4/22.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit
import CoreText

class TextViewController: UIViewController {
    /**
     行距和字距
     
     有必要提一下的是，由于绘制的实现机制不同（Core Text和WebKit），用CATextLayer渲染和用UILabel渲染出的文本行距和字距也不是不尽相同的。
     二者的差异程度（由使用的字体和字符决定）总的来说挺小，但是如果你想正确的显示普通便签和CATextLayer就一定要记住这一点。
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        let textLayer = CATextLayer.init()
        textLayer.frame = CGRect(x: 0, y: 64, width: 300, height: 300)
        textLayer.backgroundColor = UIColor.blackColor().CGColor
//        textLayer.foregroundColor = UIColor.whiteColor().CGColor
        // 是否自动换行
        textLayer.wrapped = true
        textLayer.font = CGFontCreateWithFontName(UIFont.systemFontOfSize(15.0).fontName)
        // 可以用来设置字体大小
        textLayer.fontSize = 20.0
        // textLayer.string是anyObject类型
        let string = "轻轻地，我走了，正如我轻轻地来"
        // 虽然TextLayer可以接受NSAttributedString，但是并不是所有的特性都有用，字体、颜色、字重、斜体一般都可用
        let attributeStr = NSMutableAttributedString.init(string: "盼望着，盼望着，春天来了盼望着，盼望着，春天来了盼望着，盼望着，春天来了盼望着，盼望着，春天来了盼望着，盼望着，春天来了", attributes: [NSBackgroundColorAttributeName : UIColor.redColor(),NSForegroundColorAttributeName : UIColor.orangeColor()])
        let label = TextLabel.init(frame: CGRect(x: 10, y: 400, width: 300, height: 300))
        label.numberOfLines = 0
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange.init(location: 0, length: 4))
        attributeStr.addAttributes([NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleDouble.rawValue], range: NSRange(location: 0, length: 4))
        
        label.backgroundColor = UIColor.blackColor()
        label.text = string
        label.attributedText = attributeStr
        
        self.view.addSubview(label)
        // 设置文字排列方式
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.string = attributeStr
        // 如果不设置这个属性，contentsScale默认为1，文字显示会变模糊
        textLayer.contentsScale = UIScreen.mainScreen().scale
        view.layer.addSublayer(textLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
