//
//  OfferTabCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/12/22.
//
import UIKit

class OfferTabCoordinator: TDDefaultCoordinator{
    var viewController : OfferTabViewController?
    var viewModel : OfferTabViewModelProtocol
    var productDetailsCoordinator: ProductDetailsCoordinator?
    var seeCategoriesCoordinator: SeeAllCategoriesCoordinator?
    var filterProductsCoordinator:FilterProductsCoordinator?
    
    init(viewModel: OfferTabViewModelProtocol = OfferTabViewModel()) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = OfferTabViewController.instantiate(.offerTab)
        self.viewController?.viewModel = self.viewModel
    }
}

extension OfferTabCoordinator: OfferTabViewModelCoordinatorDelegate{
    func filterProducts() {
        filterProductsCoordinator = FilterProductsCoordinator(viewModel:FilterProductsViewModel(), navigationController: self.viewController?.navigationController)
        filterProductsCoordinator?.start()
    }
    
    func seeAllCategories() {
        seeCategoriesCoordinator = SeeAllCategoriesCoordinator(viewModel:SeeAllCategoriesViewModel(), navigationController: self.viewController?.navigationController, id: 0)
        seeCategoriesCoordinator?.start()
    }
    
    
    func showProductDetails(id: Int) {
        productDetailsCoordinator = ProductDetailsCoordinator(viewModel:ProductDetailsViewModel(), navigationController: self.viewController?.navigationController, id: id, isOffer: true)
        productDetailsCoordinator?.start()
    }
}

