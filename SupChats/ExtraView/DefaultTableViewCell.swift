//
//  DefaultTableViewCell.swift
//  SupChats
//
//  Created by QJY on 2019/2/23.
//  Copyright © 2019 QJY. All rights reserved.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    @IBOutlet weak var CImage: UIImageView!
    @IBOutlet weak var CTitle: UILabel!
    @IBOutlet weak var CIntroduction: UILabel!
    
    func CellInit(ImageName:String,Title:String,Introduction:String){
        CImage.image=UIImage(named: ImageName)
        CTitle.text=Title
        CIntroduction.text=Introduction
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
