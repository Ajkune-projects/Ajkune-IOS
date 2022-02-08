//
//  CategoriesCell.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/5/22.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    @IBOutlet weak var categoryCell: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    override public var isSelected: Bool {
        didSet {
            if isSelected {
            categoryCell.addBottomBorder(with: Colors.overcastBlueColor, andWidth: 2)
                
            } else {
            categoryCell.addBottomBorder(with: .white, andWidth: 2)
            }

           
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
