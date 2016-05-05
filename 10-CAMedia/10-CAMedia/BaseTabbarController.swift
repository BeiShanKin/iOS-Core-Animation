//
//  BaseTabbarController.swift
//  10-CAMedia
//
//  Created by lz on 16/5/5.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class BaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let transition = CATransition.init()
        transition.duration = 1.0
//        transition.type = kCATransitionPush
//        transition.subtype = kCATransitionFromLeft
        self.view.layer.addAnimation(transition, forKey: nil)
        print("更换选择器")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
