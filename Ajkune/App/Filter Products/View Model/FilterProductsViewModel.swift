//
//  FilterProductsViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/8/22.
//
import Foundation

class FilterProductsViewModel: FilterProductsViewModelProtocol{
    weak var coordinatorDelegate : FilterProductsViewModelCoordinatorDelegate?
    
    func filterProducts(maxValue: String, minValue: String, type: String, completion: @escaping (([Products]?) -> Void)) {
        let filter = AuthenticationClient.filterProducts(maxValue: maxValue, minValue: minValue, type: type)
        filter.execute(onSuccess: { product in
            completion(product)
         }, onFailure: {error in
            completion(nil)
         })
    }
    
}
