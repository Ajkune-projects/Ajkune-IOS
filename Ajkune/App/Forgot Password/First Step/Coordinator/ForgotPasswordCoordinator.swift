//
//  ForgotPasswordCoordinator.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 16.10.21.
//
import UIKit

class ForgotPasswordCoordinator: TDPushCoordinator{
    var configuration: ((ForgotPasswordViewController) -> ())?
    var viewController : ForgotPasswordViewController?
    var navigationController: UINavigationController?
    var viewModel : ForgotPasswordViewModelProtocol
    var forgotPasswordVerification: ForgotPasswordVerificationCoordinator?
    
    init(viewModel: ForgotPasswordViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = ForgotPasswordViewController.instantiate(.forgetPassword)
        self.viewController?.viewModel = viewModel
    }
    
}
extension ForgotPasswordCoordinator : ForgotPasswordViewModelCoordinatorDelegate {
    func showforgotPasswordVerification() {
        forgotPasswordVerification = ForgotPasswordVerificationCoordinator(viewModel: ForgotPasswordVerificationViewModel(), navigationController: self.viewController?.navigationController)
        forgotPasswordVerification?.start()
    }
}

