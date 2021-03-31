//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 永嶋瞬 on 2021/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    
    // 配列に指定するindex番号を宣言
        var nowIndex:Int = 0
        // スライドショーに使用するタイマーを宣言
        var timer: Timer!
        // スライドショーさせる画像の配列を宣言
        var imageArray:[UIImage] = [
            UIImage(named: "sakura1")!,
            UIImage(named: "sakura2")!,
            UIImage(named: "sakura3")!
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageview.image = imageArray[nowIndex]
    }
    
    @IBAction func fButton(_ sender: Any) {
        nowIndex += 1
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0}
        // indexの画像をstoryboardの画像にセットする
        imageview.image = imageArray[nowIndex]
    }
    
    @IBAction func rButton(_ sender: Any) {
        nowIndex -= 1
        // indexが0より小さくなってしまった場合
        if (nowIndex == -1) {
            // indexを最大の数字に戻す
            nowIndex = imageArray.count-1}
        // indexの画像をstoryboardの画像にセットする
        imageview.image = imageArray[nowIndex]
    }
        @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
                if (timer == nil) {
                    // 再生時の処理を実装
                    forwardButton.isEnabled = false
                    returnButton.isEnabled = false
                    // タイマーをセットする
                    timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
                    // ボタンの名前を停止に変える
                    startButton.setTitle("停止", for: .normal)
                } else {
                    // 停止時の処理を実装
                    forwardButton.isEnabled = true
                    returnButton.isEnabled = true
                    // タイマーを停止する
                    timer.invalidate()
                    // タイマーを削除しておく
                    timer = nil
                    // ボタンの名前を再生に直しておく
                    startButton.setTitle("再生", for: .normal)
                }
    }
       @objc func changeImage() {
           // indexを増やして表示する画像を切り替える
           nowIndex += 1
           // indexが表示予定の画像の数と同じ場合
           if (nowIndex == imageArray.count) {
               // indexを一番最初の数字に戻す
               nowIndex = 0
           }
           // indexの画像をstoryboardの画像にセットする
           imageview.image = imageArray[nowIndex]
       }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
           let expansionViewController: ExpansionViewController
                = segue.destination as! ExpansionViewController

        expansionViewController.image = imageArray[nowIndex]
        if self.timer != nil {
            // 停止時の処理を実装
            forwardButton.isEnabled = true
            returnButton.isEnabled = true
            // タイマーを停止する
            timer.invalidate()
            // タイマーを削除しておく
            timer = nil
            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
        }
    }
    
}
