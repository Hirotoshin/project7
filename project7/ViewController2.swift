//
//  ViewController2.swift
//  project7
//
//  Created by 伊藤潤人 on 2016/10/07.
//  Copyright © 2016年 hirotoshin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        //aaaaaa
    }
    
    @IBAction func changebackground(sender: UIButton) {
        if button1.backgroundColor == nil{
            button1.backgroundColor = UIColor.purpleColor()
        } else if button1.backgroundColor == UIColor.purpleColor() {
            button1.backgroundColor = nil
        }
    }
    @IBAction func changebackground2(sender: UIButton) {
        if button2.backgroundColor == nil{
            button2.backgroundColor = UIColor.purpleColor()
        } else if button2.backgroundColor == UIColor.purpleColor() {
            button2.backgroundColor = nil
        }
    }
    @IBAction func changebackground3(sender: AnyObject) {
        if button3.backgroundColor == nil{
            button3.backgroundColor = UIColor.purpleColor()
        } else if button3.backgroundColor == UIColor.purpleColor() {
            button3.backgroundColor = nil
        }
    }
    @IBAction func changebackground4(sender: UIButton) {
        if button4.backgroundColor == nil{
            button4.backgroundColor = UIColor.purpleColor()
        } else if button4.backgroundColor == UIColor.purpleColor() {
            button4.backgroundColor = nil
        }
    }
 
    
    
    
}
