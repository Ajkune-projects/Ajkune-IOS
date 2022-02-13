//
//  OfferTabViewModelCoordinatorDelegate.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/12/22.
//

import Foundation
protocol OfferTabViewModelCoordinatorDelegate: AnyObject {
    func showProductDetails(id:Int)
    func seeAllCategories()
    func filterProducts()
}
