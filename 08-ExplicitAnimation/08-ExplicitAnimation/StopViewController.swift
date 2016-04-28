//
//  StopViewController.swift
//  08-ExplicitAnimation
//
//  Created by lz on 16/4/28.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class StopViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBAction func startClick(sender: UIButton) {
        let animation = CABasicAnimation.init()
        animation.keyPath = "transform.rotation";
        animation.duration = 2.0;
        animation.byValue = CGFloat(M_PI * 2);
        animation.delegate = self;
        self.imageView.layer.addAnimation(animation, forKey: "Rotation")
    }
    @IBAction func stopClick(sender: UIButton) {
        self.imageView.layer.removeAnimationForKey("Rotation")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
