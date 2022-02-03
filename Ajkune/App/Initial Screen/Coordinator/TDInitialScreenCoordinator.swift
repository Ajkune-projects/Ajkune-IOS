//
//  TDCoordinator.swift
//  
//
//  Created by Djellza Rrustemi
//

import Foundation

protocol TDInitialScreenCoordinatorDelegate {
    func initializeLoginScreen()
}

class TDInitialScreenCoordinator: TDDefaultCoordinator{    
    
    var viewController : TDInitialScreenViewController?
    var viewModel : TDInitialScreenViewModelProtocol
    var coordinatorDelegate : TDInitialScreenCoordinatorDelegate?
    var signUpCoordinator: SignUpCoordinator?
    
    init(viewModel: TDInitialScreenViewModelProtocol) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = TDInitialScreenViewController.instantiate(.initialScreen)
        self.viewController?.viewModel = self.viewModel
    }
}

extension TDInitialScreenCoordinator: TDInitialScreenViewModelCoordinatorDelegate{
    func showSignUp() {
        signUpCoordinator = SignUpCoordinator(viewModel: SignUpViewModel(), navigationController: self.viewController?.navigationController)
        signUpCoordinator?.start()
    }
    func initializeLogin(){
        self.coordinatorDelegate?.initializeLoginScreen()
    }
}
