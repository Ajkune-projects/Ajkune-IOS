//
//  ProductDetailsCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/6/22.
//

import Foundation
import UIKit

class ProductDetailsCoordinator: TDPushCoordinator{
    var configuration: ((ProductDetailsViewController) -> ())?
    var viewController : ProductDetailsViewController?
    var navigationController: UINavigationController?
    var viewModel : ProductDetailsViewModelProtocol
    
    init(viewModel: ProductDetailsViewModelProtocol, navigationController:UINavigationController?, id:Int) {
        self.viewModel = viewModel
//        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = ProductDetailsViewController.instantiate(.productDetails)
        self.viewController?.id = id
    }
}
