//
//  VectorDrawViewController.swift
//  13-DrawPicture
//
//  Created by lz on 16/5/17.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class VectorDrawViewController: UIViewController {

    var drawView: DrawView?
    @IBAction func btnClick(sender: UIButton) {
        if (self.drawView?.paths.count > 0) {
            self.drawView?.paths.removeLast()
            self.drawView?.setNeedsDisplay()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let drawView:DrawView = DrawView.init(frame: self.view.bounds)
        // 必须设置backgroundColor不然会有BUG
        drawView.backgroundColor = UIColor.blackColor()
//        drawView.clearsContextBeforeDrawing = true
        self.view.insertSubview(drawView, atIndex: 0)
        self.drawView = drawView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
