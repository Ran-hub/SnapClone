//
//  HomeViewController.swift
//  SnapClone
//
//  Created by ashika shanthi on 2/9/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var hScroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camView: CamViewController = CamViewController(nibName: "CamViewController", bundle: nil)
        let chatView: ChatViewController = ChatViewController(nibName: "ChatViewController", bundle: nil)
        let storyView: StoryViewController = StoryViewController(nibName: "StoryViewController", bundle: nil)
        
        self.addChildViewController(chatView)
        self.hScroll.addSubview(chatView.view)
        chatView.didMove(toParentViewController: self)
        
        self.addChildViewController(camView)
        self.hScroll.addSubview(camView.view)
        camView.didMove(toParentViewController: self)
        
        self.addChildViewController(storyView)
        self.hScroll.addSubview(storyView.view)
        storyView.didMove(toParentViewController: self)
        
        print(self.view.frame,chatView.view.frame,camView.view.frame,storyView.view.frame)
        var frame2: CGRect = camView.view.frame
        frame2.origin.x = self.view.frame.width
        camView.view.frame = frame2
        
        var frame3: CGRect = storyView.view.frame
        frame3.origin.x = 2 * self.view.frame.width
        storyView.view.frame = frame3
        
        self.hScroll.contentSize = CGSize(width: self.view.frame.width*3, height: 667)
        print(self.view.frame,chatView.view.frame,camView.view.frame,storyView.view.frame)
        print(self.hScroll.contentSize)
    }
   
    

}
