//
//  DisplayTableViewCell.swift
//  AlamoFireDemo
//
//  Created by mahavir on 21/07/17.
//  Copyright © 2017 mobileFirst. All rights reserved.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {

    
    @IBOutlet var txtName: UITextField!
    
    @IBOutlet var lblDisply: UILabel!
    
    @IBOutlet var imageUpload: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
