//
//  WordsTableViewCell.swift
//  HangMan
//
//  Created by Eric Chung on 7/27/17.
//  Copyright © 2017 Eric Chung. All rights reserved.
//

import UIKit

class WordsTableViewCell: UITableViewCell {

    @IBOutlet weak var WordLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
