//
//  HomeTabCoordinator.swift
//  
//
//  Created by Djellza Rrustemi
//

import UIKit

class HomeTabCoordinator: TDDefaultCoordinator{
    var viewController : HomeTabViewController?
    var viewModel : HomeTabViewModelProtocol
    var productDetailsCoordinator: ProductDetailsCoordinator?
    var seeCategoriesCoordinator: SeeAllCategoriesCoordinator?
    
    init(viewModel: HomeTabViewModelProtocol = HomeTabViewModel()) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = HomeTabViewController.instantiate(.homeTab)
        self.viewController?.viewModel = self.viewModel
    }
}

extension HomeTabCoordinator: HomeTabViewModelCoordinatorDelegate{
    func seeAllCategories() {
        seeCategoriesCoordinator = SeeAllCategoriesCoordinator(viewModel:SeeAllCategoriesViewModel(), navigationController: self.viewController?.navigationController, id: 0)
        seeCategoriesCoordinator?.start()
    }
    
    func HomeTabShown() {
        //
    }
    
    func showProductDetails(id: Int) {
        productDetailsCoordinator = ProductDetailsCoordinator(viewModel:ProductDetailsViewModel(), navigationController: self.viewController?.navigationController, id: id)
        productDetailsCoordinator?.start()
    }
}