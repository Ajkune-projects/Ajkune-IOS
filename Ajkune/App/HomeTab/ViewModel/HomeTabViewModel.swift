//
//  HomeTabViewModel.swift
//
//
//  Created by Djellza Rrustemi
//

import Foundation
protocol HomeTabViewModelViewDelegate: class {
    func selectedCategory(id: Int)
    func productDetails(id: Int)
}
class HomeTabViewModel: HomeTabViewModelProtocol{
    var productDataSource: ProductsDataSource?
    var categoryDataSource: CategoryDataSource?
    var viewDelegate: HomeTabViewModelViewDelegate?
    weak var coordinatorDelegate : HomeTabViewModelCoordinatorDelegate?
    
    func HomeTabShown() {
        coordinatorDelegate?.HomeTabShown()
    }
    public init(){
        self.categoryDataSource = CategoryDataSource()
        self.productDataSource = ProductsDataSource()
        self.productDataSource?.delegate = self
        self.categoryDataSource?.delegate = self
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
        let products = AuthenticationClient.getALLProducts()
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
        let products = AuthenticationClient.getProductsByID(id: id)
        products.execute(onSuccess: { product in
            completion(product)
         }, onFailure: {error in
            completion(nil)
         })
    }
    
}

extension HomeTabViewModel:CategoryDataSourceProtocol{
    func categoryTapped(id: Int) {
        self.viewDelegate?.selectedCategory(id: id)
    }
}

extension HomeTabViewModel:ProductsDataSourceProtocol{
    func productDetails(id: Int) {
        self.viewDelegate?.productDetails(id: id)
    }
    
    
}
