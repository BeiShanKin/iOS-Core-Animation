//
//  Transform2DViewController.swift
//  05-LayerTransform
//
//  Created by lz on 16/4/23.
//  Copyright © 2016年 SY. All rights reserved.

import UIKit

class Transform2DViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
        CGAffineTransformMake(a,b,c,d,tx,ty)总结
        a为-1时，图片左右翻转，d为-1时，图片上下翻转。c为1时，图片向左斜拉，高不变，c为-1时，图片向右斜拉，高不变，b为1时图片左高右低斜拉，宽不变，b为-1时图片左低右高，宽不变。tx为正向有平移，为负向左平移，ty为正向下平移，为负向上平移。
        */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        var transform = self.containerView.transform
        print("origin ---------- \(transform)")
        // 旋转值为正时顺时针旋转，旋转值为负时逆时针旋转。同时旋转的正负还受Scale时两个值的正负影响。
        transform = CGAffineTransformRotate(transform, CGFloat(radiansToDegrees(45) * -1))
        print("rotate ---------- \(transform)")
        // Scale不仅能起到放大缩小的作用，当Scale传入的值为负的时候还能起到旋转的作用。当sx的值为负的时候，view会以Y轴为中心轴进行旋转180°，当sy为负时，图形会以X轴为中心轴进行旋转180°。当sx，sy都为负时，图形会顺时针旋转180°。由于Scale的正负可以影响view的旋转，所以当同时进行负值的变化和旋转时，两者会进行相互作用，产生各种神奇的效果。
        transform = CGAffineTransformScale(transform, -1.0, 1.0)
        // 可以将两个transform合并成一个
//        transform = CGAffineTransformConcat(transform, transform)
        print("scale ---------- \(transform)")
//        UIView.animateWithDuration(1.0) { () -> Void in
//            self.containerView.transform = transform
//        }
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            self.containerView.transform = transform
            }) { (isAnimation) -> Void in
                // CGAffineTransformIdentity可以生成一个初始化的Transform，将View恢复原样
                self.containerView.transform = CGAffineTransformIdentity
        }
        transform = self.containerView.transform
        print("final ---------- \(transform)")
    }
    
    func singleTransform() {
        // 带make的方法都是在view的原始基础上改变，连续调用只出现一次效果。
        //        self.containerView.transform = CGAffineTransformMakeScale(2.0, 2.0)
        
        /**
        transform的6个属性，a、b、c、d、tx，ty中，a代表的是view的宽度的倍数，初始值为1.0，d代表的是高的倍数，初始值为1.0;tx代表的在x轴方向的位移，初始值为0.0，ty代表的是在y轴方向的位移，初始值为0.0。
        当涉及到旋转时，a、d 和 b、c 会交替的负责放大。
        */
        var transform = self.containerView.transform
        print(transform)
        // 不带make的方法都是在view的当前基础上改变，连续调用每一次都会有效果
        UIView.animateWithDuration(1.0) { () -> Void in
            self.containerView.transform = CGAffineTransformRotate(self.containerView.transform, CGFloat(M_PI_2))
        }
        transform = self.containerView.transform
        print(transform)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
