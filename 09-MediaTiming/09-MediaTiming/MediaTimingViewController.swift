//
//  MediaTimingViewController.swift
//  09-MediaTiming
//
//  Created by lz on 16/4/28.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class MediaTimingViewController: UIViewController {

    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var repeatCountTextField: UITextField!
    @IBAction func startClick(sender: UIButton) {
        let animation = CABasicAnimation.init()
        animation.keyPath = "transform.rotation"
        animation.toValue = M_PI * 2
        if repeatCountTextField.text?.characters.count > 0 {
            animation.repeatCount = Float(repeatCountTextField.text!)!
        } else {
            animation.repeatCount = 1.0
        }
        
        if durationTextField.text?.characters.count > 0 {
            animation.duration = Double(durationTextField.text!)!
        } else {
            animation.duration = 1.0
        }
        self.imageView.layer.addAnimation(animation, forKey: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
