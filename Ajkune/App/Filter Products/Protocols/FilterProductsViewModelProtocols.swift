//
//  FilterProductsViewModelProtocols.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/8/22.
//

import Foundation
protocol FilterProductsViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : FilterProductsViewModelCoordinatorDelegate? {get set}
    
    //API
    func filterProducts(maxValue:String, minValue:String, type:String,completion: @escaping (([Products]?) -> Void))
}
