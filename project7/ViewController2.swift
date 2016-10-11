//
//  ViewController2.swift
//  project7
//
//  Created by 伊藤潤人 on 2016/10/07.
//  Copyright © 2016年 hirotoshin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var cameraroll: UIBarButtonItem!
    @IBOutlet weak var camera: UIBarButtonItem!
    @IBOutlet weak var imageview: UIImageView!
    
    
    
    
    
    
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
 
    @IBAction func cameraroll(sender: AnyObject) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .PhotoLibrary
        pickerController.delegate = self
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    @IBAction func camera(sender: AnyObject) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.Camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageview.contentMode = .ScaleAspectFit
            imageview.image = pickedImage
        }
        
        //閉じる処理
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
}
