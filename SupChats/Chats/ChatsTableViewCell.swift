//
//  ChatsTableViewCell.swift
//  SupChats
//
//  Created by QJY on 05/09/2018.
//  Copyright © 2018 QJY. All rights reserved.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {
    
    struct ChatsBaseCellLayout{
        let ProfilePhotoLayout:String
        let UserNameLayout:String
        let UserLastMessageLayout:String
        let LastmessageTimeLayout:String
    }
    
    
    @IBOutlet var ProfilePhoto: UIImageView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var UserLastMessage: UILabel!
    @IBOutlet var LastMessageTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
