//
//  FriendsViewController.swift
//  SnapClone
//
//  Created by ashika shanthi on 2/11/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var friendsTableView: UITableView!
    var friends = ["john", "appleseed", "regina", "richard"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FriendTableViewCell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendTableViewCell
        let friend = friends[indexPath.row]
        cell.friendImage.image = UIImage(named: "\(friend)")
        cell.friendName.text = friend
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "FriendTableViewCell", bundle: nil)
        friendsTableView.register(nib, forCellReuseIdentifier: "friendCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
