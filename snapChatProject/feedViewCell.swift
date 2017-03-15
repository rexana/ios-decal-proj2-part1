//
//  feedViewCell.swift
//  snapChatProject
//
//  Created by Rexana Church on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class feedViewCell: UITableViewCell {

    @IBOutlet weak var readStatusImage: UIImageView!
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var timeReceivedLabel: UILabel!
    var isUnread: Bool?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        isUnread = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
