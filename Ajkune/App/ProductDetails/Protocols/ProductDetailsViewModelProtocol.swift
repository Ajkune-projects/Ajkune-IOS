//
//  ProductDetailsViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
protocol ProductDetailsViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : ProductDetailsViewModelCoordinatorDelegate? {get set}

    
    //API
    func getProductDetails(id:Int, completion: @escaping (([Products]?) -> Void))
}
