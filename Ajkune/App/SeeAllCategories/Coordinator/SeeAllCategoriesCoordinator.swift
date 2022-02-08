//
//  SeeAllCategoriesCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/7/22.
//

import Foundation
import UIKit

class SeeAllCategoriesCoordinator: TDPushCoordinator{

    var configuration: ((SeeAllCategoriesViewController) -> ())?
    var viewController : SeeAllCategoriesViewController?
    var navigationController: UINavigationController?
    var viewModel : SeeAllCategoriesViewModelProtocol
    var homeTabCoordinator: HomeTabCoordinator?
    
    init(viewModel: SeeAllCategoriesViewModelProtocol, navigationController:UINavigationController?, id:Int) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = SeeAllCategoriesViewController.instantiate(.seeAllCategories)
//        self.viewController?.id = id
        self.viewController?.viewModel = viewModel
    }
}

extension SeeAllCategoriesCoordinator:SeeAllCategoriesViewModelCoordinatorDelegate{
}
