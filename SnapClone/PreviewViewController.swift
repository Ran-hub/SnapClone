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
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = previewImage
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
    
    @IBAction func saveAction(_ sender: Any) {
        guard let imageToSave = previewImage else {return}
       UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
