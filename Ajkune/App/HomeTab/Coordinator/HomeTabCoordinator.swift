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
    func HomeTabShown() {
        //
    }
    
    func showProductDetails(id: Int) {
        productDetailsCoordinator = ProductDetailsCoordinator(viewModel:ProductDetailsViewModel(), navigationController: self.viewController?.navigationController, id: id)
        productDetailsCoordinator?.start()
    }
}
