//
//  UserAddressCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/11/22.
//

import Foundation
import Foundation
import UIKit

class UserAddressCoordinator: TDPushCoordinator{

    var configuration: ((UserAddressViewController) -> ())?
    var viewController : UserAddressViewController?
    var navigationController: UINavigationController?
    var viewModel : UserAddressViewModelProtocol
    var homeTabCoordinator: HomeTabCoordinator?

    
    init(viewModel: UserAddressViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = UserAddressViewController.instantiate(.userAddress)
//        self.viewController?.id = id
        self.viewController?.viewModel = viewModel
    }
}

extension UserAddressCoordinator:UserAddressViewModelCoordinatorDelegate{
}
