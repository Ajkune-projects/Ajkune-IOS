//
//  ProductDetailsViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    weak var coordinatorDelegate: ProductDetailsViewModelCoordinatorDelegate?
    
    //API
    func getProductDetails(id: Int, completion: @escaping (([Products]?) -> Void)) {
            let products = AuthenticationClient.getProductDetails(id: id)
            products.execute(onSuccess: { product in
                completion(product)
             }, onFailure: {error in
                completion(nil)
             })
    }
    
}
