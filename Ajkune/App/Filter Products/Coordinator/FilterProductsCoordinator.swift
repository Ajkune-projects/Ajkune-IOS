//
//  FilterProductsCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/8/22.
//

import Foundation
import UIKit

class FilterProductsCoordinator: TDPushCoordinator{

    var configuration: ((FilterProductsViewController) -> ())?
    var viewController : FilterProductsViewController?
    var navigationController: UINavigationController?
    var viewModel : FilterProductsViewModelProtocol
    var homeTabCoordinator: HomeTabCoordinator?
    
    init(viewModel: FilterProductsViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = FilterProductsViewController.instantiate(.filterProducts)
//        self.viewController?.id = id
        self.viewController?.viewModel = viewModel
    }
}

extension FilterProductsCoordinator:FilterProductsViewModelCoordinatorDelegate{
}
