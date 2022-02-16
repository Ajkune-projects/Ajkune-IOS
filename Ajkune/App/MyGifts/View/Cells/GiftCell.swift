//
//  GiftCell.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

import UIKit

class GiftCell: UITableViewCell {

    @IBOutlet weak var giftDesc: UILabel!
    @IBOutlet weak var giftImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
