//
//  HomeTabViewModelCoordinatorDelegate.swift
//  
//
//  Created by Djellza Rrustemi
//

import Foundation
protocol HomeTabViewModelCoordinatorDelegate: AnyObject {
    func showProductDetails(id:Int)
    func seeAllCategories()
    func filterProducts()
}
