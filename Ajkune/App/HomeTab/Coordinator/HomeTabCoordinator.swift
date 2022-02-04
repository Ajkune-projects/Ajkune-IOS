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
    
    init(viewModel: HomeTabViewModelProtocol = HomeTabViewModel()) {
        self.viewModel = viewModel
//        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = HomeTabViewController.instantiate(.homeTab)
        self.viewController?.viewModel = self.viewModel
    }
}

