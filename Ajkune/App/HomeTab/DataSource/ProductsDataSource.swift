//
//  ProductsDataSource.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/5/22.
//

import Foundation
import UIKit
import Cosmos
import EmptyDataSet_Swift

import UIKit
protocol ProductsDataSourceProtocol: class {
    func productDetails(id: Int)
}
final class ProductsDataSource: NSObject, UICollectionViewDataSource, EmptyDataSetSource,EmptyDataSetDelegate {
    
    //MARK: - Properties
    weak var delegate : ProductsDataSourceProtocol?
    var products:[Products]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(ProductCell.self, for: indexPath)
        if let product = products?[indexPath.row]{
            if let image = product.image{
                cell.productImage.setImage(with: image
                )
            }
            cell.productImage.shadowView()
            cell.descriptionProductLbl.text = product.name
            cell.productPriceLbl.text = "\(product.price ?? "0.0")CHF"
            cell.raiting.rating = Double(product.rating ?? 0)
            cell.raiting.settings.updateOnTouch = false
            cell.mainView.shadowView()
        }
        return cell
    }
    func customView(forEmptyDataSet scrollView: UIScrollView) -> UIView? {
        let view = ProductsEmptyView(frame: CGRect(x: 0, y: 200, width: 300, height: 160))
        return view
    }
}

extension ProductsDataSource: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let product = products?[indexPath.row].id{
        delegate?.productDetails(id: product)
        }
    }
}
