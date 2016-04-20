//
//  CATreeController.swift
//  01-CALayerTree
//
//  Created by lz on 16/4/19.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class CATreeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view.layer.sublayers ",self.view.layer.sublayers)
        let layerView = UIView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        layerView.center = view.center
        layerView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(layerView);
        print("view.layer.sublayers ",self.view.layer.sublayers)
    }

    override func viewDidAppear(animated: Bool) {
        // 由此方法可知，当向一个View1中添加View2时，View2的layer也会被自动的添加进View1的layer中去。也就是说，View之间不仅存在视图层级树，同是也存在图层层级树。
        self.view.layer.sublayers?.map{
            let layer = $0 as? CALayer
            print(layer?.frame)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
