//
//  PreviewViewController.swift
//  SnapClone
//
//  Created by ashika shanthi on 2/10/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//
import Foundation
import AVFoundation
import UIKit

class PreviewViewController: UIViewController {
        
    var previewImage: UIImage!
    var storyDelegate: AddDatatoStoryView?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imageView.image = previewImage
    }
   
    
    
    @IBAction func saveAction(_ sender: Any) {
       guard let imageToSave = previewImage else {return}
        storyDelegate?.addData(imageToSave)
       UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
