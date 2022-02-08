//
//  SeeAllCategoriesDataSource.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/7/22.
//

import Foundation
import UIKit

import UIKit
protocol SeeAllCategoriesDataSourceProtocol: class {
    func SeeAllCategoriesTapped(id: Int)
}
final class SeeAllCategoriesDataSource: NSObject, UITableViewDataSource{
    
    //MARK: - Properties
    weak var delegate : SeeAllCategoriesDataSourceProtocol?
    var categories:[Categories]?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(CategoryCell.self, for: indexPath)
        cell.selectionStyle = .none
        cell.categoryNameLbl.text = categories?[indexPath.row].name
        return cell
    }
}

extension SeeAllCategoriesDataSource: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        globalData.categoryIndexPath = indexPath
        let cell = tableView.dequeue(CategoryCell.self, for: indexPath)
        cell.mainView.addBottomBorder(with: Colors.overcastBlueColor, andWidth: 2)
        self.delegate?.SeeAllCategoriesTapped(id: categories?[indexPath.row].id ?? 0)
        globalData.categorySelected = categories?[indexPath.row].id ?? 0
        globalData.fromAllCategories = true
        cell.selectionStyle = .none
        cell.categoryNameLbl.textColor = Colors.overcastBlueColor
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeue(CategoryCell.self, for: indexPath)
//        cell.mainView.addBottomBorder(with: .white, andWidth: 2)
        cell.categoryNameLbl.textColor = .black
    }
    
}
