//
//  OpacityViewController.swift
//  04-VisionLayer
//
//  Created by lz on 16/4/22.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {

    @IBOutlet weak var viewLeft: UIView!
    @IBOutlet weak var viewRight: UIView!
    @IBOutlet weak var labelLeft: UILabel!
    @IBOutlet weak var labelRight: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
        理想状况下，当你设置了一个图层的透明度，你希望它包含的整个图层树像一个整体一样的透明效果。你可以通过设置Info.plist文件中的Renders with group opacity为YES来达到这个效果，但是这个设置会影响到这个应用，整个app可能会受到不良影响。如果Renders with group opacity并未设置，iOS 6和以前的版本会默认为NO（最新的版本似乎默认是YES啦）
        */
        self.viewRight.layer.opacity = 0.5
        /**
        通过设置shouldRasterize可以将viewRight和其中的子图层变为一个整体，这样设置viewRight的透明度时其子图层的透明度也就会一起变化。在现在（2016年04月22日14:50:48）Renders with group opacity默认为YES，此时设置shouldRasterize似乎没有用处，只有将shouldRasterize设置为No时shouldRasterize才有用
        */
        self.viewRight.layer.shouldRasterize = true
        self.labelRight.layer.opacity = 0.50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
