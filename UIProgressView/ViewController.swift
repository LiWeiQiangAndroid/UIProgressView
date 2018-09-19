//
//  ViewController.swift
//  UIProgressView
//
//  Created by 李维强 on 2018/9/19.
//  Copyright © 2018 李维强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer?
    var index:Int = 0
    
    let progressView = UIProgressView(progressViewStyle: UIProgressView.Style.default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //添加到当前视图
        self.view.addSubview(progressView)
        
        progressView.frame = CGRect(x: 20, y: 100, width: 280, height: 10)
        
        //当前进度条值
        progressView.progress = 0.5
        //进度条已走过的进度条颜色
        progressView.progressTintColor = UIColor.green
        
        //进度条剩下的进度条颜色
        progressView.trackTintColor = UIColor.red
        
        //为进度条设置image
        progressView.progressImage = UIImage(named: "imageM")
        
        progressView.trackImage = UIImage(named: "imageN")
        

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(progressChange), userInfo: nil, repeats: true)
        //过去某时间执行
        timer?.fireDate = Date.distantPast
    
        
    }
    
    @objc func progressChange() {
        index+=1
        if index>10 {
            //未来执行
            timer?.fireDate = Date.distantFuture
            timer?.invalidate()
            return
        }
        
        print("进度执行了\(index*10)%")
        progressView.progress = Float(index)/10
    }


}

