//
//  AnchorPointViewController.swift
//  03-LayerGeometry
//
//  Created by lz on 16/4/20.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class AnchorPointViewController: UIViewController {

    @IBOutlet weak var clockFaceImageView: UIImageView!
    @IBOutlet weak var hourHandImageView: UIImageView!
    @IBOutlet weak var minuteHandImageView: UIImageView!
    @IBOutlet weak var secondHandImageView: UIImageView!
    weak var timer: NSTimer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // 改变anchorPoint的位置，center的位置也就随之改变，会变到anchorPoint当前所在的位置，也就是说，center和anchorPoint始终在同一个位置
        self.hourHandImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.85)
        self.minuteHandImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.85)
        self.secondHandImageView.layer.anchorPoint = CGPoint(x: 0.5, y: 0.85)
        let timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "tick", userInfo: nil, repeats: true)
        self.timer = timer
        self.tick()
    }
    
    override func viewDidLayoutSubviews() {
        self.setupHand()
    }
    
    func setupHand() {
        self.hourHandImageView.center = self.clockFaceImageView.center
        self.minuteHandImageView.center = self.clockFaceImageView.center
        self.secondHandImageView.center = self.clockFaceImageView.center
    }
    
    func tick() {
        let components = self.getCurrentTime()
        let hour = (Double(components.hour) / 12.0) * M_PI * 2.0
        let minute = (Double(components.minute) / 60.0) * M_PI * 2.0
        let second = (Double(components.second) / 60.0) * M_PI * 2.0
        UIView.beginAnimations(nil, context: nil)
        self.hourHandImageView.transform = CGAffineTransformMakeRotation(CGFloat(hour))
        self.minuteHandImageView.transform = CGAffineTransformMakeRotation(CGFloat(minute))
        self.secondHandImageView.transform = CGAffineTransformMakeRotation(CGFloat(second))
        UIView.commitAnimations()
    }
    
    func getCurrentTime() -> NSDateComponents {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([NSCalendarUnit.Hour,.Minute,.Second], fromDate: date)
//        print("hour \(components.hour) minute \(components.minute) second \(components.second)")
        return components
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
