//
//  FavoriteSessionTableViewCell.swift
//  Chariot
//
//  Created by Alex Santarelli on 10/1/15.
//  Copyright © 2015 iInnovate. All rights reserved.
//

import UIKit

class FavoriteSessionTableViewCell: UITableViewCell {

    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
