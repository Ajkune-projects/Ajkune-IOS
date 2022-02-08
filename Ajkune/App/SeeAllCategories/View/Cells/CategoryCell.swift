//
//  CategoryCell.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/7/22.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override public var isSelected: Bool {
        didSet {
            if isSelected {
                categoryNameLbl.textColor = Colors.overcastBlueColor
                
            } else {
                categoryNameLbl.textColor = .black
            }

           
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        categoryNameLbl.text = categoryNameLbl.text?.uppercased()
    }
    
}
