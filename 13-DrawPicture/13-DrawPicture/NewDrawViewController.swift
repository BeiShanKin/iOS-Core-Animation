//
//  NewDrawViewController.swift
//  13-DrawPicture
//
//  Created by lz on 16/5/17.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class NewDrawViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawView:LayerDrawView = LayerDrawView.init(frame: self.view.bounds)
        // 必须设置backgroundColor不然会有BUG
        drawView.backgroundColor = UIColor.whiteColor()
        //        drawView.clearsContextBeforeDrawing = true
        self.view.insertSubview(drawView, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
