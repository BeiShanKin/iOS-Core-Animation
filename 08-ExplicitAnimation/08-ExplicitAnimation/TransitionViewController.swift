//
//  TransitionViewController.swift
//  08-ExplicitAnimation
//
//  Created by lz on 16/4/28.
//  Copyright © 2016年 SY. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {

    lazy var images: [UIImage] = {
        return [UIImage.init(named: "Anchor")!,UIImage.init(named: "Cone")!,UIImage.init(named: "Igloo")!,UIImage.init(named: "Spaceship")!]
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = self.images.first
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        transition2()
    }
    
    func transition1() {
        var index = self.images.indexOf(imageView.image!)
        index = (index! < self.images.count - 1) ? index! + 1 : 0
        let image = self.images[index!]
        let transition = CATransition.init()
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        transition.duration = 1.0
        self.imageView.layer.addAnimation(transition, forKey: nil)
        self.imageView.image = image
    }
    
    func transition2() {
        var index = self.images.indexOf(imageView.image!)
        index = (index! < self.images.count - 1) ? index! + 1 : 0
        let image = self.images[index!]
        UIView.transitionWithView(self.imageView, duration: 2.0, options: .TransitionFlipFromLeft, animations: { () -> Void in
            self.imageView.image = image
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
