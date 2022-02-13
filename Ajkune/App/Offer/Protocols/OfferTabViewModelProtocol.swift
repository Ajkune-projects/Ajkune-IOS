//
//  OfferTabViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/12/22.
//

import Foundation

protocol OfferTabViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : OfferTabViewModelCoordinatorDelegate? {get set}
    var viewDelegate: OfferTabViewModelViewDelegate? {get set}
    var productDataSource : OfferDataSource? {get}
    var categoryDataSource : CategoryDataSource? {get}
    func getALLProducts(products: [Products]?)
    func getProductsByID(products:[Products]?)
    func getCategorie(cat:[Categories]?)
    func showProductDetails(id:Int)
    func seeAllCategories()
    func filterProducts()
    
    //API
    func getALLProducts(completion: @escaping (([Products]?) -> Void))
    func getCategories(completion: @escaping (([Categories]?) -> Void))
    func getBanner(completion: @escaping (([Banner]?) -> Void))
    func getProductsByID(id:Int, completion: @escaping (([Products]?) -> Void))
}
