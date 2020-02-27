//
//  RearTableViewCell.swift
//  TabbarRaj
//
//  Created by apple on 2/19/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class RearTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
