//
//  SignUpCoordinator.swift
//  Ajkune
//
//  Created by Djellza Rrustemi
//

import UIKit

class SignUpCoordinator: TDPushCoordinator{
    
    var configuration: ((SignUpViewController) -> ())?
    var viewController : SignUpViewController?
    var navigationController: UINavigationController?
    var viewModel : SignUpViewModelProtocol
    var loginCoordinator: LoginCoordinator?
    
    init(viewModel: SignUpViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = SignUpViewController.instantiate(.signUp)
        self.viewController?.viewModel = viewModel
    }
}
extension SignUpCoordinator : SignUpViewModelCoordinatorDelegate {
    func showLogin() {
        loginCoordinator = LoginCoordinator(viewModel: LoginViewModel())
        loginCoordinator?.start()
    }
}
