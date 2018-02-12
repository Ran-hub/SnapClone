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
    @IBOutlet weak var storyPreview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyPreview.image = img
    }


    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
