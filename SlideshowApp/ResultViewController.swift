//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Tsubasa Kato on 2017/06/30.
//  Copyright © 2017 Tsubasa Kato. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
   
    //UIImageView2
    @IBOutlet weak var ResultImageView: UIImageView!
    
    //画像定義
    var sendImage: UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // 遷移前のイメージを拡大表示
        var transScale = CGAffineTransform()
        self.ResultImageView.image = sendImage
        transScale = CGAffineTransform(scaleX: 2, y: 2)
        ResultImageView.transform = transScale
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
