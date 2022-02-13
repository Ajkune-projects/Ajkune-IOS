//
//  OfferDataSource.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/12/22.
//

import Foundation
import UIKit
import Cosmos

import UIKit
protocol OfferDataSourceProtocol: class {
    func productDetails(id: Int)
}
final class OfferDataSource: NSObject, UICollectionViewDataSource {
    
    //MARK: - Properties
    weak var delegate : OfferDataSourceProtocol?
    var products:[Products]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(OfferProductCell.self, for: indexPath)
        if let product = products?[indexPath.row]{
            if let image = product.image{
                cell.productImage.setImage(with: image
                )
            }
            cell.productImage.shadowView()
            cell.descriptionProductLbl.text = product.name
            cell.productPriceLbl.text = "\(product.price ?? "0.0")CHF"
            cell.initialPrice.text = "\(product.initial_price ?? "0.0")CHF"
            cell.raiting.rating = Double(product.rating ?? 0)
            cell.raiting.settings.updateOnTouch = false
            cell.mainView.shadowView()
        }
        return cell
    }
}

extension OfferDataSource: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let product = products?[indexPath.row].id{
        delegate?.productDetails(id: product)
        }
    }
}
