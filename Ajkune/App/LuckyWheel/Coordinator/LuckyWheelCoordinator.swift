//
//  LuckyWheelCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

import Foundation
import UIKit

class LuckyWheelCoordinator: TDPushCoordinator{

    var configuration: ((LuckyWheelViewController) -> ())?
    var viewController : LuckyWheelViewController?
    var navigationController: UINavigationController?
    var viewModel : LuckyWheelViewModelProtocol
    var homeTabCoordinator: HomeTabCoordinator?

    
    init(viewModel: LuckyWheelViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = LuckyWheelViewController.instantiate(.luckyWheel)
//        self.viewController?.id = id
        self.viewController?.viewModel = viewModel
    }
}

extension LuckyWheelCoordinator:LuckyWheelViewModelCoordinatorDelegate{
}
