//
//  HomeTabViewModelProtocol.swift
//  
//
//  Created by Djellza Rrustemi
//

import Foundation

protocol HomeTabViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : HomeTabViewModelCoordinatorDelegate? {get set}
    var viewDelegate: HomeTabViewModelViewDelegate? {get set}
    var productDataSource : ProductsDataSource? {get}
    var categoryDataSource : CategoryDataSource? {get}
    func getALLProducts(products: [Products]?)
    func getProductsByID(products:[Products]?)
    func getCategorie(cat:[Categories]?)
    func showProductDetails(id:Int)
    
    //API
    func getALLProducts(completion: @escaping (([Products]?) -> Void))
    func getCategories(completion: @escaping (([Categories]?) -> Void))
    func getBanner(completion: @escaping (([Banner]?) -> Void)) 
    func getProductsByID(id:Int, completion: @escaping (([Products]?) -> Void))
}
