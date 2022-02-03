//
//  ForgotPasswordVerificationCoordinator.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//
import UIKit

class ForgotPasswordVerificationCoordinator: TDPushCoordinator{
    var configuration: ((ForgotPasswordVerificationViewController) -> ())?
    var viewController : ForgotPasswordVerificationViewController?
    var navigationController: UINavigationController?
    var viewModel : ForgotPasswordVerificationViewModelProtocol
    var restPasswordCoordinator: ResetPasswordCoordinator?
    
    init(viewModel: ForgotPasswordVerificationViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = ForgotPasswordVerificationViewController.instantiate(.forgetPasswordVerification)
        self.viewController?.viewModel = viewModel
    }
}
extension ForgotPasswordVerificationCoordinator : ForgotPasswordVerificationViewModelCoordinatorDelegate {
    func showResetPassword() {
        restPasswordCoordinator = ResetPasswordCoordinator(viewModel: ResetPasswordViewModel(), navigationController: self.viewController?.navigationController)
        restPasswordCoordinator?.start()
    }
    
}

