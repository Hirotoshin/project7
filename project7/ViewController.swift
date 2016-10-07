//
//  ViewController.swift
//  project7
//
//  Created by 伊藤潤人 on 2016/09/30.
//  Copyright © 2016年 hirotoshin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 var timer:NSTimer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
                                                       target: self,
                                                       selector: #selector(ViewController.changeView),
                                                       userInfo: nil,
                                                       repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //aaaaaa
    }
    
    func changeView() {
        self.performSegueWithIdentifier("second", sender: nil)
    }


}

