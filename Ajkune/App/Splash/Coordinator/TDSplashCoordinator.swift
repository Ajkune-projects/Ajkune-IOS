//
//  SplashCoordinator.swift

//
//  Created by Djellza Rrustemi 
//

import UIKit

protocol TDSplashCoordinatorDelegate {
    func splashShownSuccessful()
    func goToMain()
}

class TDSplashCoordintaor: TDDefaultCoordinator{
    var viewController : TDSplashViewController?
    var viewModel : TDSplashViewModelProtocol
    var coordinatorDelegate : TDSplashCoordinatorDelegate?
    
    init(viewModel: TDSplashViewModelProtocol = TDSplashViewModel()) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = TDSplashViewController.instantiate(.splash)
        self.viewController?.viewModel = self.viewModel
    }
}

extension TDSplashCoordintaor: TDSplashViewModelCoordinatorDelegate{
    func splashShown() {
        self.coordinatorDelegate?.splashShownSuccessful()
    }
    func goToMain() {
        self.coordinatorDelegate?.goToMain()
    }
}
