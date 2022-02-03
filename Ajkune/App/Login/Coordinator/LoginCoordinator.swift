//
//  LoginCoordinator.swift
//  
//
//  Created Djellza Rrustemi
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate {
    func loginSuccessful()
}

class LoginCoordinator: TDDefaultCoordinator{
    var viewController : LoginViewController?
    var viewModel : LoginViewModelProtocol
    var coordinatorDelegate : LoginCoordinatorDelegate?
    var signUpCoordinator: SignUpCoordinator?
//    var forgotPasswordCoordinator: TDForgotPasswordCoordinator?
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = LoginViewController.instantiate(.login)
        self.viewController?.viewModel = self.viewModel
    }
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate{
    func showSignUp() {
        signUpCoordinator = SignUpCoordinator(viewModel: SignUpViewModel(), navigationController: self.viewController?.navigationController)
        signUpCoordinator?.start()
    }
    func showForgotPassword() {
//        forgotPasswordCoordinator = TDForgotPasswordCoordinator(viewModel: TDForgotPasswordViewModel(), navigationController: self.viewController?.navigationController)
//        forgotPasswordCoordinator?.start()
    }
    
    func loginSuccessful() {
        self.coordinatorDelegate?.loginSuccessful()
    }
}
