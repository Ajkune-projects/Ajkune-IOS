//
//  ProductCell.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/5/22.
//

import UIKit
import Cosmos

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var descriptionProductLbl: UILabel!
    @IBOutlet weak var raiting: CosmosView!
    @IBOutlet weak var productPriceLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
