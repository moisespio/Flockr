//
//  HeaderFeedTableViewCell.swift
//  flockr
//
//  Created by Matheus Frozzi Alberton on 27/11/16.
//  Copyright © 2016 flockr. All rights reserved.
//

import UIKit

class HeaderFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var petProfilePhoto: UIImageView!
    @IBOutlet weak var petProfileUsername: UILabel!
    @IBOutlet weak var petPostTimeAgo: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
