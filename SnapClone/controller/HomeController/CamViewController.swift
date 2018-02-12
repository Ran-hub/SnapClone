//
//  CamViewController.swift
//  SnapClone
//
//  Created by ashika shanthi on 2/9/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class CamViewController: UIViewController{
    
    @IBOutlet weak var cam: UIView!
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var cameraToggle: UIButton!
    @IBOutlet weak var flashToggle: UIButton!
    var prevImage: UIImage!
    
    let cameraController = CameraController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton()
        configureCameraController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureCameraController() {
        cameraController.prepare {(error) in
            if let error = error {
                print(error)
            }
            
            try? self.cameraController.displayPreview(on: self.cam)
        }
    }
    func styleButton(){
        captureButton.layer.cornerRadius = captureButton.frame.height/2
        captureButton.layer.borderColor = UIColor.red.cgColor
        captureButton.layer.borderWidth = 2
    }
    
    
    @IBAction func toggleCamera(_ sender: Any) {
        do {
            try cameraController.switchCameras()
        }
            
        catch {
            print(error)
        }
        
        switch cameraController.currentCameraPosition {
        case .some(.front):
            cameraToggle.setImage(UIImage(named: "ic_camera_front_3x"), for: .normal)
        case .some(.rear):
            cameraToggle.setImage(UIImage(named: "ic_camera_rear_3x"), for: .normal)
        case .none:
            return
        }
    }
    
    @IBAction func toggleFlash(_ sender: Any) {
        if cameraController.flashMode == AVCaptureDevice.FlashMode.on {
            cameraController.flashMode = AVCaptureDevice.FlashMode.off
            flashToggle.setImage(UIImage(named: "ic_flash_off_3x"), for: .normal)
        }
            
        else {
            cameraController.flashMode = AVCaptureDevice.FlashMode.on
            flashToggle.setImage(UIImage(named: "ic_flash_on_3x"), for: .normal)
        }
    }
    
    @IBAction func captureImage(_ sender: Any) {
        cameraController.captureImage {(image, error) in
            guard let image = image else {
                print(error ?? "Image capture error")
                return
            }
            self.prevImage = image
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "Preview") as? PreviewViewController{
                vc.previewImage = self.prevImage
                vc.storyDelegate = self.parent?.childViewControllers[2] as? StoryViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }  
}
