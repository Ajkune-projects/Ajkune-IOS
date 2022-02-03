//
//  FirstScreenCoordinator.swift
//  
//
//  Created by Djellza Rrustemi
//

import UIKit

class FirstScreenCoordinator: TDDefaultCoordinator{
    var viewController : FirstScreenViewController?
    var viewModel : FirstScreenViewModelProtocol
    
    init(viewModel: FirstScreenViewModelProtocol = FirstScreenViewModel()) {
        self.viewModel = viewModel
//        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = FirstScreenViewController.instantiate(.firstScreen)
        self.viewController?.viewModel = self.viewModel
    }
}

