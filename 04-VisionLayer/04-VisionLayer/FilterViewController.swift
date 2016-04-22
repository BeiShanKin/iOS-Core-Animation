//
//  FilterViewController.swift
//  04-VisionLayer
//
//  Created by lz on 16/4/22.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    var timer: NSTimer?
    @IBOutlet var digits: [UIImageView]!
    @IBOutlet weak var triliner: UIImageView!
    @IBOutlet weak var liner: UIImageView!
    @IBOutlet weak var near: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.digits.map {
            $0.layer.magnificationFilter = kCAFilterNearest
        }
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "tick", userInfo: nil, repeats: true)
        self.tick()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // 简单来说，kCAFilterTrilinear和kCAFilterLinear是一边拉伸或者缩小图片，一边做颜色渐变，这样出来的图片整体感更好，但是会有一种模糊的感觉。而kCAFilterNearest则是简单粗暴，不管是拉伸还是缩小，都不会做颜色的渐变，所以不会增加新的颜色，在如果是颜色复杂的图片，就会出现很明显的颗粒感，但是如果图片颜色纯而少，就会显得很清晰。
        self.triliner.layer.minificationFilter = kCAFilterTrilinear
        self.liner.layer.minificationFilter = kCAFilterLinear
        self.near.layer.minificationFilter = kCAFilterNearest
    }
    
    func getCurrentTime() -> NSDateComponents {
        let date = NSDate.init()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour,.Minute,.Second], fromDate: date)
        return components
    }
    
    func tick() {
        let components = self.getCurrentTime()
        let timeNumbers = self.getTimeNumbers(components)
        for (var i = 0; i < self.digits.count; i++) {
            self.digits[i].layer.contentsRect = CGRect(x: timeNumbers[i] * 0.1, y: 0, width: 0.1, height: 1.0)
        }
    }
    
    func getTimeNumbers(time: NSDateComponents) -> [Double] {
        var timeNumbers = [Double]()
        timeNumbers.append(Double(time.hour / 10 % 10))
        timeNumbers.append(Double(time.hour % 10))
        timeNumbers.append(Double(time.minute / 10 % 10))
        timeNumbers.append(Double(time.minute % 10))
        timeNumbers.append(Double(time.second / 10 % 10))
        timeNumbers.append(Double(time.second % 10))
        return timeNumbers
    }
    
    func updateDigitView(digit: Double,view: UIImageView) {
        view.layer.contentsRect = CGRect(x: digit * 0.1, y: 0.0, width: 0.1, height: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
