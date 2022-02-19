//
//  OfferProductCell.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//
import UIKit
import Cosmos

class OfferProductCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var initialPrice: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var descriptionProductLbl: UILabel!
    @IBOutlet weak var initialPriceUnderline: UIView!
    @IBOutlet weak var raiting: CosmosView!
    @IBOutlet weak var productPriceLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

