//
//  ViewController.swift
//  original_swift
//
//  Created by 阿部 竜之介 on 2015/02/17.
//  Copyright (c) 2015年 RyunosukeAbe. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    //HANABI
    let tama = UIView()
    @IBOutlet var label :UILabel!
    
    var θ : Float = 0
    var x : Float = 0
    var y : Float = 0
    
    var width: CGFloat!
    var height: CGFloat!
    
    
    var timer : NSTimer!

    
    var audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("se-039a", ofType: "mp3")!)
    var audioPath2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("wao", ofType: "mp3")!)
    var player = AVAudioPlayer()
    var player2 = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
/*
        //UIViewController.viewの座標取得
        var x:CGFloat = self.view.bounds.origin.x
        var y:CGFloat = self.view.bounds.origin.y
*/
        //View・labelのColorを設定
        self.view.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.18, alpha: 1.0)
        label.textColor = UIColor.whiteColor()
        
        //画面サイズを取得
        width = self.view.bounds.width;
        height = self.view.bounds.height
        
        //花火の玉の設定
        x = Float(width) / 2
        y = Float(height) + 100
        tama.frame =  CGRect(x: CGFloat(x), y: CGFloat(y), width: 30, height: 30)
        tama.layer.cornerRadius = 15
        tama.backgroundColor = UIColor.redColor();
        
        //カスタマイズViewを追加
        self.view.addSubview(tama)
        
        //タイマーの設定
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
        //タップを認識
        let myTap = UITapGestureRecognizer(target: self, action: "tapGesture:")
        
        //花火の玉にgesture設定
        tama.addGestureRecognizer(myTap)
        
        player = AVAudioPlayer(contentsOfURL: audioPath, error: nil)
        player.prepareToPlay()
        player2 = AVAudioPlayer(contentsOfURL: audioPath2, error: nil)
        player2.prepareToPlay()

        
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//Timerのメソッド
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
//タップのメソッド
    func tapGesture(sender: UITapGestureRecognizer){
        player.pause()
        player2.play()
        
        var stPoint_x = tama.center.x
        var stPoint_y = tama.center.y
        
        tama.removeFromSuperview()

        // サイズを生成 (x, y, width, height): x,yは表示位置
        var rect    = CGRectMake(0, 0, 10, 10)
        // 生成したサイズを使って、ビューを生成
        
        //ポーズ
        
        var count1 : Int = 0
        var count2 : Int = 0
        for(var i = 0.0 ; i < 1 ; i = i + 0.01){
            
            for(var j = -1.0 ; j < 1.5 ; j = j + 0.01){
                
                if(pow(i,2)+pow((j - pow(i,2/3)),2) <= 1 && pow(i,2)+pow((j - pow(i,2/3)),2) >= 0.95){
                    //ハート右
                    var view_count1 = UIView(frame: rect)
                    view_count1.layer.cornerRadius = 5
                    
                    var boom1_x = Float(stPoint_x) + Float(i*100)
                    var boom1_y = Float(stPoint_y) - Float(j*90)
                    
                    //サイズと位置を指定します(x座標, y座標, width, height)
                    view_count1.frame = CGRectMake(CGFloat(boom1_x) ,CGFloat(boom1_y) , 10, 10)
                    
                    /* まとめて書く事も可能です */
                    //let view= UIView(frame:CGRectMake(0, 0, 150, 150))
                    
                    //viewの背景色（alphaは透過度）
                    view_count1.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
                    
                    //view1をself.viewに追加
                    self.view.addSubview(view_count1)
                    
                    count1 += 1
                    
                    //ハート右
                    var view_count2 = UIView(frame: rect)
                    view_count2.layer.cornerRadius = 5
                    
                    var boom2_x = Float(stPoint_x) - Float(i*100)
                    var boom2_y = Float(stPoint_y) - Float(j*90)
                    
                    //サイズと位置を指定します(x座標, y座標, width, height)
                    view_count2.frame = CGRectMake(CGFloat(boom2_x) ,CGFloat(boom2_y) , 10, 10)
                    
                    /* まとめて書く事も可能です */
                    //let view= UIView(frame:CGRectMake(0, 0, 150, 150))
                    
                    //viewの背景色（alphaは透過度）
                    view_count2.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
                    
                    //view1をself.viewに追加
                    self.view.addSubview(view_count2)
                    
                    count2 += 1
                    
                }
            }
            
        }
        println(count1)
        
    }
    
        
    
}

