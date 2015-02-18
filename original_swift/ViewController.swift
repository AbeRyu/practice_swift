//
//  ViewController.swift
//  original_swift
//
//  Created by 阿部 竜之介 on 2015/02/17.
//  Copyright (c) 2015年 RyunosukeAbe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //HANABI
    let tama = UIView()
    
    var θ : Float = 0
    var x : Float = 0
    var y : Float = 0
    
    var width: CGFloat!
    var height: CGFloat!
    
    
    var timer : NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
/*
        //UIViewController.viewの座標取得
        var x:CGFloat = self.view.bounds.origin.x
        var y:CGFloat = self.view.bounds.origin.y
*/
        //UIViewController.viewの幅と高さを取得
        width = self.view.bounds.width;
        height = self.view.bounds.height
        
        //上記より画面ぴったりサイズのフレームを生成する
        x = Float(width) / 2
        y = Float(height) + 100
        tama.frame =  CGRect(x: CGFloat(x), y: CGFloat(y), width: 30, height: 30)
        
        tama.layer.cornerRadius = 15
        //カスタマイズViewを生成
        tama.backgroundColor = UIColor.redColor();
        
        //カスタマイズViewを追加
        self.view.addSubview(tama)
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func onUpdate(timer : NSTimer){
        θ += 0.15
        x += cos(θ)
        y -= 1.5
        var movePoint:CGPoint = CGPointMake(CGFloat(x), CGFloat(y))
        tama.center = movePoint
        
        if(tama.center.y < -10){
            tama.removeFromSuperview()
        }
    }


}

