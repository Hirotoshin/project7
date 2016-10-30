//
//  ViewController2.swift
//  project7
//
//  Created by 伊藤潤人 on 2016/10/07.
//  Copyright © 2016年 hirotoshin. All rights reserved.
//

import UIKit


class ViewController2: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var cameraroll: UIBarButtonItem!
    @IBOutlet weak var camera: UIBarButtonItem!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var UIview: UIView!
    @IBOutlet weak var text: UITextView!
    
   
    @IBOutlet weak var scrollview: UIScrollView!
    
    //var lastPoint: CGPoint?                 //直前のタッチ座標の保存用
   // var lineWidth: CGFloat?                 //描画用の線の太さの保存用
   // var bezierPath = UIBezierPath()         //お絵描きに使用
    //var drawColor = UIColor()               //描画色の保存用
    
    //let defaultLineWidth: CGFloat = 30.0    //デフォルトの線の太さ
    //var txtActiveView: UITextView!//編集後のtextViewを新しく格納する変数を定義
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // textに枠を追加
        text.layer.borderWidth = 0.3
        text.layer.cornerRadius = 8
        
        //ビューを作成する。
        let testView = UIView()
        testView.frame.size.height = 60
        //testView.backgroundColor = UIColor.whiteColor()
        
        //「閉じるボタン」を作成する。
        let closeButton = UIButton(frame:CGRectMake(CGFloat( UIScreen.mainScreen().bounds.size.width)-70, 0, 70, 50))
        closeButton.setTitle("Close", forState:UIControlState.Normal)
        closeButton.backgroundColor = UIColor.redColor()
        closeButton.addTarget(self,action:#selector(ViewController2.onClickCloseButton(_:)), forControlEvents: .TouchUpInside)
        
        //ビューに「閉じるボタン」を追加する。
        testView.addSubview(closeButton)
        
        //キーボードのアクセサリにビューを設定する。
        text.inputAccessoryView = testView
        
        //テキストビューのデリゲート先にこのインスタンスを設定する。
      text.delegate = self

     /*   scrollview.delegate = self
        scrollview.minimumZoomScale = 1.0                   // 最小拡大率
        scrollview.maximumZoomScale = 4.0                   // 最大拡大率
        scrollview.zoomScale = 1.0                          // 表示時の拡大率(初期値)
        
        prepareDrawing()                                    //お絵描き準備*/
        
    }
    
    //「閉じるボタン」で呼び出されるメソッド
    func onClickCloseButton(sender: UIButton) {
        //キーボードを閉じる
        text.resignFirstResponder()
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
   
    //背景の色の変換
    @IBAction func ChangeColor1(sender: UIButton) {
        if self.button.backgroundColor == UIColor.yellowColor(){
            self.view.backgroundColor = UIColor.yellowColor()
            self.button.backgroundColor = UIColor.whiteColor()
            self.text.backgroundColor = UIColor.yellowColor()
            self.button5.backgroundColor = UIColor.purpleColor()
        }else{
            self.view.backgroundColor = UIColor.whiteColor()
            self.button.backgroundColor = UIColor.yellowColor()
            self.text.backgroundColor = UIColor.whiteColor()
            self.button5.backgroundColor = UIColor.purpleColor()
        }

    }
    
    @IBAction func ChangeColor2(sender: UIButton) {
        if self.button5.backgroundColor == UIColor.purpleColor(){
            self.view.backgroundColor = UIColor.purpleColor()
            self.text.backgroundColor = UIColor.purpleColor()
            self.button5.backgroundColor = UIColor.whiteColor()
            self.button.backgroundColor = UIColor.yellowColor()
        }else{
            self.view.backgroundColor = UIColor.whiteColor()
            self.text.backgroundColor = UIColor.whiteColor()
            self.button5.backgroundColor = UIColor.purpleColor()
            self.button.backgroundColor = UIColor.yellowColor()
        }

    }
    
    
    
    
    
    
 
    @IBAction func cameraroll(sender: AnyObject) {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .PhotoLibrary
        pickerController.delegate = self
        self.presentViewController(pickerController, animated: true, completion: nil)
    }
    
    //camera処理
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
    
    
    
    
    
    
  /*
    
    
    /**
     拡大縮小に対応
     */
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageview
    }
    
    /**
     UIGestureRecognizerでお絵描き対応。1本指でなぞった時のみの対応とする。
     */
    private func prepareDrawing() {
        
        //実際のお絵描きで言う描く手段(色えんぴつ？クレヨン？絵の具？など)の準備
        let myDraw = UIPanGestureRecognizer(target: self, action: #selector(ViewController2.drawGesture(_:)))
        myDraw.maximumNumberOfTouches = 1
        self.scrollview.addGestureRecognizer(myDraw)
        
        //実際のお絵描きで言うキャンバスの準備 (=何も描かれていないUIImageの作成)
        prepareCanvas()
        
    }
    
    /**
     キャンバスの準備 (何も描かれていないUIImageの作成)
     */
    func prepareCanvas() {
        let canvasSize = CGSizeMake(view.frame.width * 5, view.frame.height * 2)     //キャンバスのサイズの決定
        let canvasRect = CGRectMake(0, 0, canvasSize.width * 10, canvasSize.height * 10)      //キャンバスのRectの決定
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, 0.0)              //コンテキスト作成(キャンバスのUIImageを作成する為)
        var firstCanvasImage = UIImage()                                            //キャンバス用UIImage(まだ空っぽ)
        //白色塗りつぶし作業2
        firstCanvasImage.drawInRect(canvasRect)                                     //firstCanvasImageの内容を描く(真っ白)
        firstCanvasImage = UIGraphicsGetImageFromCurrentImageContext()              //何も描かれてないUIImageを取得
        imageview.contentMode = .ScaleAspectFit                                    //contentModeの設定
        imageview.image = firstCanvasImage                                         //画面の表示を更新
        UIGraphicsEndImageContext()                                                 //コンテキストを閉じる
    }
    
    /**
     draw動作
     */
    @IBAction func drawGesture(sender: AnyObject) {
        guard let drawGesture = sender as? UIPanGestureRecognizer else {
            print("drawGesture Error happened.")
            return
        }
        
        guard let canvas = self.imageview.image else {
            fatalError("self.pictureView.image not found")
        }
        
        lineWidth = defaultLineWidth                                    //描画用の線の太さを決定する
        drawColor = UIColor.redColor()                                //draw色を決定する
        let touchPoint = drawGesture.locationInView(imageview)         //タッチ座標を取得
        
        switch drawGesture.state {
        case .Began:
            lastPoint = touchPoint                                      //タッチ座標をlastTouchPointとして保存する
            
            //touchPointの座標はscrollView基準なのでキャンバスの大きさに合わせた座標に変換しなければいけない
            //LastPointをキャンバスサイズ基準にConvert
            let lastPointForCanvasSize = convertPointForCanvasSize(originalPoint: lastPoint!, canvasSize: canvas.size)
            
            bezierPath.lineCapStyle = .Round                            //描画線の設定 端を丸くする
            bezierPath.lineWidth = defaultLineWidth                     //描画線の太さ
            bezierPath.moveToPoint(lastPointForCanvasSize)
            
        case .Changed:
            
            let newPoint = touchPoint                                   //タッチポイントを最新として保存
            
            //Draw実行しDraw後のimage取得
            let imageAfterDraw = drawGestureAtChanged(canvas, lastPoint: lastPoint!, newPoint: newPoint, bezierPath: bezierPath)
            
            self.imageview.image = imageAfterDraw                      //Draw画像をCanvasに上書き
            lastPoint = newPoint                                        //Point保存
            
        case .Ended:
            print("Finish dragging")
            
        default:
            ()
        }
        if button4.backgroundColor == nil{
            button4.backgroundColor = UIColor.purpleColor()
        } else if button4.backgroundColor == UIColor.purpleColor() {
            button4.backgroundColor = nil
        }
    }
    
    
    /**
     UIGestureRecognizerのStatusが.Changedの時に実行するDraw動作
     
     - parameter canvas : キャンバス
     - parameter lastPoint : 最新のタッチから直前に保存した座標
     - parameter newPoint : 最新のタッチの座標座標
     - parameter bezierPath : 線の設定などが保管されたインスタンス
     - returns : 描画後の画像
     */
    func drawGestureAtChanged(canvas: UIImage, lastPoint: CGPoint, newPoint: CGPoint, bezierPath: UIBezierPath) -> UIImage {
        
        //最新のtouchPointとlastPointからmiddlePointを算出
        let middlePoint = CGPointMake((lastPoint.x + newPoint.x) / 2, (lastPoint.y + newPoint.y) / 2)
        
        //各ポイントの座標はscrollView基準なのでキャンバスの大きさに合わせた座標に変換しなければいけない
        //各ポイントをキャンバスサイズ基準にConvert
        let middlePointForCanvas = convertPointForCanvasSize(originalPoint: middlePoint, canvasSize: canvas.size)
        let lastPointForCanvas   = convertPointForCanvasSize(originalPoint: lastPoint, canvasSize: canvas.size)
        
        bezierPath.addQuadCurveToPoint(middlePointForCanvas, controlPoint: lastPointForCanvas)  //曲線を描く
        UIGraphicsBeginImageContextWithOptions(canvas.size, false, 0.0)                 //コンテキストを作成
        let canvasRect = CGRectMake(0, 0, canvas.size.width, canvas.size.height)        //コンテキストのRect
        self.imageview.image?.drawInRect(canvasRect)                                   //既存のCanvasを準備
        drawColor.setStroke()                                                           //drawをセット
        bezierPath.stroke()                                                             //draw実行
        let imageAfterDraw = UIGraphicsGetImageFromCurrentImageContext()                //Draw後の画像
        UIGraphicsEndImageContext()                                                     //コンテキストを閉じる
        
        return imageAfterDraw
    }
    
    /**
     (おまじない)座標をキャンバスのサイズに準じたものに変換する
     
     - parameter originalPoint : 座標
     - parameter canvasSize : キャンバスのサイズ
     - returns : キャンバス基準に変換した座標
     */
    func convertPointForCanvasSize(originalPoint originalPoint: CGPoint, canvasSize: CGSize) -> CGPoint {
        
        let viewSize = scrollview.frame.size
        var ajustContextSize = canvasSize
        var diffSize: CGSize = CGSizeMake(0, 0)
        let viewRatio = viewSize.width / viewSize.height
        let contextRatio = canvasSize.width / canvasSize.height
        let isWidthLong = viewRatio < contextRatio ? true : false
        
        if isWidthLong {
            
            ajustContextSize.height = ajustContextSize.width * viewSize.height / viewSize.width
            diffSize.height = (ajustContextSize.height - canvasSize.height) / 2
            
        } else {
            
            ajustContextSize.width = ajustContextSize.height * viewSize.width / viewSize.height
            diffSize.width = (ajustContextSize.width - canvasSize.width) / 2
            
        }
        
        let convertPoint = CGPointMake(originalPoint.x * ajustContextSize.width / viewSize.width - diffSize.width,
                                       originalPoint.y * ajustContextSize.height / viewSize.height - diffSize.height)
        
        
        return convertPoint
        
    }

    
    
    // Viewが画面に表示される度に呼ばれるメソッド
    override func viewWillAppear(animated: Bool) {
        // NSNotificationCenterへの登録処理
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(ViewController2.handleKeyboardWillShowNotification(_:)), name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(ViewController2.handleKeyboardWillHideNotification(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }
    // Viewが非表示になるたびに呼び出されるメソッド
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        // NSNotificationCenterの解除処理
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
    }
    //画面がタップされた際にキーボードを閉じる処理
    func tapGesture(sender: UITapGestureRecognizer) {
        text.resignFirstResponder()
        
    }
    //キーボードのreturnが押された際にキーボードを閉じる処理
    func textViewShouldReturn(textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        //        itemMemo.resignFirstResponder()
        return true
    }
    //textViewを編集する際に行われる処理
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        txtActiveView = textView //　編集しているtextViewを新しいtextView型の変数に代入する
        return true
    }
    
    //キーボードが表示された時
    func handleKeyboardWillShowNotification(notification: NSNotification) {
        //郵便入れみたいなもの
        let userInfo = notification.userInfo!
        //キーボードの大きさを取得
        let keyboardRect = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        // 画面のサイズを取得
        let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
        //　ViewControllerを基準にtextViewの下辺までの距離を取得
        let txtLimit = txtActiveView.frame.origin.y + txtActiveView.frame.height + 8.0
        // ViewControllerの高さからキーボードの高さを引いた差分を取得
        let kbdLimit = myBoundSize.height - keyboardRect.size.height
        
        // こうすることで高さを確認できる（なくてもいい）
        print("テキストフィールドの下辺：(\(txtLimit))")
        print("キーボードの上辺：(\(kbdLimit))")
        
        //スクロールビューの移動距離設定
        if txtLimit >= kbdLimit {
            scrollview.contentOffset.y = txtLimit - kbdLimit
        }
    }
    
    
    //ずらした分を戻す処理
    func handleKeyboardWillHideNotification(notification: NSNotification) {
        scrollview.contentOffset.y = 0
    }

    */
   
    
    
    
}
