//
//  StoryPreviewViewController.swift
//  SnapClone
//
//  Created by ashika shanthi on 2/11/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit

class StoryPreviewViewController: UIViewController {
    var img : UIImage!
    var imgset = [UIImage]()
    var counter = 0
    var time = 3
    var timer: Timer!
    @IBOutlet weak var storyPreview: UIImageView!
    
    @IBOutlet weak var timerLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = imgset.count * 3
        storyPreview.image = imgset.first
        imgset = Array(imgset.dropFirst())
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.previewTimer), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func previewTimer(){
        if time == 0{
        if imgset == []{
            timer.invalidate()
            self.navigationController?.popViewController(animated: true)
        }
        else{
            storyPreview.image = imgset.first
            imgset = Array(imgset.dropFirst())
            time = 3
            timerLbl.text = "\(time)"
            }}
        else {time = time - 1
            timerLbl.text = "\(time)"
        }
    }
}
