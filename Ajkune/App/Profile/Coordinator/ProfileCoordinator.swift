//
//  ProfileCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import Foundation
import UIKit

class ProfileCoordinator: TDPushCoordinator{

    var configuration: ((ProfileViewController) -> ())?
    var viewController : ProfileViewController?
    var navigationController: UINavigationController?
    var viewModel : ProfileViewModelProtocol
    var homeTabCoordinator: HomeTabCoordinator?

    
    init(viewModel: ProfileViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = ProfileViewController.instantiate(.profile)
//        self.viewController?.id = id
        self.viewController?.viewModel = viewModel
    }
}

extension ProfileCoordinator:ProfileViewModelCoordinatorDelegate{
}
