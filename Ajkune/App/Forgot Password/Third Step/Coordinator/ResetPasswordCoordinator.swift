//
//  ResetPasswordCoordinator.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//
import UIKit

class ResetPasswordCoordinator: TDPushCoordinator{
    var configuration: ((ResetPasswordViewController) -> ())?
    var viewController : ResetPasswordViewController?
    var navigationController: UINavigationController?
    var viewModel : ResetPasswordViewModelProtocol
    
    init(viewModel: ResetPasswordViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
//        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = ResetPasswordViewController.instantiate(.resetPassword)
        self.viewController?.viewModel = viewModel
    }
    
    
}
//extension ResetPasswordCoordinator : ResetPasswordViewModelCoordinatorDelegate {
//}

