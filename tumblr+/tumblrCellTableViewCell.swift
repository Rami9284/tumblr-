//
//  tumblrCellTableViewCell.swift
//  tumblr+
//
//  Created by Judith Ramirez on 1/30/19.
//  Copyright © 2019 Judith Ramirez. All rights reserved.
//

import UIKit

class tumblrCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
