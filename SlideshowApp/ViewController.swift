//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Tsubasa Kato on 2017/06/22.
//  Copyright © 2017 Tsubasa Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //UIImageVIew
    @IBOutlet weak var imageView: UIImageView!
    
    //戻るボタン
    @IBOutlet weak var backButton: UIButton!
    
    //再生/停止ボタン
    @IBOutlet weak var playstopButton: UIButton!
    
    //進むボタン
    @IBOutlet weak var nextButton: UIButton!
    
    //現在のイメージ番号
    var dispImageNo = 0
    
    //画像の配列
    let imageNameArrey = ["image-1", "image-2", "image-3", "image-4", "image-5"]
    
    //タイマーの生成
    var timer: Timer?
    
    //タイマーの秒数
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIImageViewに現在のイメージ番号の画像を表示
        imageView.image = UIImage(named: imageNameArrey[dispImageNo])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //表示してる画像の番号を元に画像を表示する
    func displayImage(){
        
        //最初まで行ったら最後へ
        if dispImageNo < 0{
            dispImageNo = 4}
    
        //最後まで行ったら最初へ
        if dispImageNo > 4{
            dispImageNo = 0}
    
        //画像の番号から名前の取り出し
        let name = imageNameArrey [dispImageNo]
        
        //画像を読み込み
        let image = UIImage(named:name)
        
        //ImageViewに読み込んだ画像をセット
        imageView.image = image
    }
    
    //画像を2秒で遷移
    func updateTimer(timer: Timer){
        self.timer_sec += 2
        //進むボタンを押すと1つ先の画像を表示
        dispImageNo += 1
        //画像を表示
        displayImage()
    }
    
    // segueから遷移先のResultViewControllerを取得する
    // 遷移先のResultViewControllerのUIImageView2に画像を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result" {
            let rvc: ResultViewController = segue.destination as! ResultViewController
            rvc.sendImage = self.imageView.image
        //タイマー破棄
            self.timer?.invalidate()
            self.timer = nil
        }
        
    }

    
    //再生停止ボタン IBAction
    @IBAction func playstop(_ sender: Any) {
        //再生ボタンを押すとタイマー始動, 停止ボタンを押すとタイマー破棄
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            nextButton.isEnabled = false
            backButton.isEnabled = false
        }
        else {
        self.timer?.invalidate()
        self.timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    //進むボタン IBAction
    @IBAction func next(_ sender: Any) {
        //進むボタンを押すと1つ先の画像を表示
        dispImageNo += 1
        //画像を表示
        displayImage()
    }
    
    //戻るボタン IBAction
    @IBAction func back(_ sender: Any) {
        //戻るボタンを1つ前の画像を表示
        dispImageNo -= 1
        //画像を表示
        displayImage()
    }
    
    //タップアクション
    @IBAction func onTapImage(_ sender: Any) {
        //セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    //画面を戻る
    @IBAction func unwind(_ segue:UIStoryboardSegue){}
    
}
