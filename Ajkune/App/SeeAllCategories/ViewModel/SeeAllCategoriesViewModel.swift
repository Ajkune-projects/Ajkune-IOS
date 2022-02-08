//
//  SeeAllCategoriesViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/7/22.
//

import Foundation
protocol SeeAllCategoriesViewModelViewDelegate: class {
    func selectedCategory(id: Int)
}
class SeeAllCategoriesViewModel: SeeAllCategoriesViewModelProtocol{
    var dataSource: SeeAllCategoriesDataSource?
    var viewDelegate: SeeAllCategoriesViewModelViewDelegate?
    weak var coordinatorDelegate : SeeAllCategoriesViewModelCoordinatorDelegate?
    
    
    public init(){
        self.dataSource = SeeAllCategoriesDataSource()
        self.dataSource?.delegate = self
    }
    
    func getCategorie(cat: [Categories]?) {
        self.dataSource?.categories = cat
    }
    
    
    //API
    func getCategories(completion: @escaping (([Categories]?) -> Void)) {
        let categories = AuthenticationClient.getCategories()
        categories.execute(onSuccess: { category in
            completion(category)
         }, onFailure: {error in
            completion(nil)
         })
    }
    
}

extension SeeAllCategoriesViewModel:SeeAllCategoriesDataSourceProtocol{
    func SeeAllCategoriesTapped(id: Int) {
        self.viewDelegate?.selectedCategory(id: id)
    }
}

