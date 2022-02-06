//
//  CategoryDataSource.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/5/22.
//

import Foundation
import UIKit

import UIKit
protocol CategoryDataSourceProtocol: class {
    func categoryTapped(id: Int)
}
final class CategoryDataSource: NSObject, UICollectionViewDataSource {
    
    //MARK: - Properties
    weak var delegate : CategoryDataSourceProtocol?
    var categories:[Categories]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(CategoriesCell.self, for: indexPath)
        if indexPath.row == 0 {
            self.collectionView(collectionView, didSelectItemAt: indexPath)
        }
        cell.lblName.text = categories?[indexPath.row].name
        return cell
    }
}

extension CategoryDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }
}
extension CategoryDataSource: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoriesCell {
            cell.categoryCell.addBottomBorder(with: Colors.overcastBlueColor, andWidth: 2)
            self.delegate?.categoryTapped(id: categories?[indexPath.row].id ?? 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            guard let cell = collectionView.cellForItem(at: indexPath) as? CategoriesCell else {
                    return
            }
        cell.categoryCell.addBottomBorder(with: .white, andWidth: 2)

        }
}
