//
//  FriendTableViewCell.swift
//  SnapClone
//
//  Created by ashika shanthi on 2/11/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var friendImage: UIImageView!
    @IBOutlet weak var friendName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        formatting()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func formatting(){
        friendImage.layer.cornerRadius = friendImage.frame.width/2
    }
    
}
