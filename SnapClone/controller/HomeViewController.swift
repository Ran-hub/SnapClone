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
        let friendsView: FriendsTableViewController = FriendsTableViewController(nibName: "FriendsTableViewController", bundle: nil)
        let storyView: StoryViewController = StoryViewController(nibName: "StoryViewController", bundle: nil)
        
        self.addChildViewController(friendsView)
        self.hScroll.addSubview(friendsView.view)
        friendsView.didMove(toParentViewController: self)
        
        self.addChildViewController(camView)
        self.hScroll.addSubview(camView.view)
        camView.didMove(toParentViewController: self)
        
        self.addChildViewController(storyView)
        self.hScroll.addSubview(storyView.view)
        storyView.didMove(toParentViewController: self)
       
        var frame2: CGRect = camView.view.frame
        frame2.origin.x = self.view.frame.width
        camView.view.frame = frame2
        
        var frame3: CGRect = storyView.view.frame
        frame3.origin.x = 2 * self.view.frame.width
        storyView.view.frame = frame3
        
        self.hScroll.contentSize = CGSize(width: self.view.frame.width*3, height: 667)
        
    }
   
    

}
