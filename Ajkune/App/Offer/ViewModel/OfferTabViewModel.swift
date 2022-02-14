//
//  OfferTabViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/12/22.
//
import Foundation
protocol OfferTabViewModelViewDelegate: class {
    func productDetails(id: Int)
}
class OfferTabViewModel: OfferTabViewModelProtocol{
    var productDataSource: OfferDataSource?
    var categoryDataSource: CategoryDataSource?
    var viewDelegate: OfferTabViewModelViewDelegate?
    weak var coordinatorDelegate : OfferTabViewModelCoordinatorDelegate?
    
    func OfferTabShown() {
//        coordinatorDelegate?.OfferTabShown()
    }
    public init(){
        self.categoryDataSource = CategoryDataSource()
        self.productDataSource = OfferDataSource()
        self.productDataSource?.delegate = self
    }
    func getALLProducts(products: [Products]?) {
        productDataSource?.products = products ?? [Products]()
    }
    
    func getProductsByID(products: [Products]?) {
//        self.productDataSource?.products = products
    }
    func getCategorie(cat: [Categories]?) {
        self.categoryDataSource?.categories = cat
    }
    func showProductDetails(id:Int) {
        self.coordinatorDelegate?.showProductDetails(id: id)
    }
    
    func seeAllCategories() {
        self.coordinatorDelegate?.seeAllCategories()
    }
    func filterProducts(){
        self.coordinatorDelegate?.filterProducts()
    }

    //API
    func getALLProducts(completion: @escaping (([Products]?) -> Void)) {
        let products = AuthenticationClient.getALLProductsFromOffer()
        products.execute(onSuccess: { product in
            completion(product)
         }, onFailure: {error in
            completion(nil)
         })
    }
    func getCategories(completion: @escaping (([Categories]?) -> Void)) {
        let categories = AuthenticationClient.getCategories()
        categories.execute(onSuccess: { category in
            completion(category)
         }, onFailure: {error in
            completion(nil)
         })
    }
    func getBanner(completion: @escaping (([Banner]?) -> Void)) {
        let banner = AuthenticationClient.getBanner()
        banner.execute(onSuccess: { banner in
            completion(banner)
         }, onFailure: {error in
            completion(nil)
         })
    }
    func getProductsByID(id: Int, completion: @escaping (([Products]?) -> Void)) {
        let products = AuthenticationClient.getProductsByIdOffer(id: id)
        products.execute(onSuccess: { product in
            completion(product)
         }, onFailure: {error in
            completion(nil)
         })
    }
    
}

extension OfferTabViewModel:OfferDataSourceProtocol{
    func productDetails(id: Int) {
        self.viewDelegate?.productDetails(id: id)
    }
    
    
}

