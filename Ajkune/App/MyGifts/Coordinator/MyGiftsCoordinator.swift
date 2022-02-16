//
//  MyGiftsCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

import Foundation
import UIKit

class MyGiftsCoordinator: TDPushCoordinator{

    var configuration: ((MyGiftsViewController) -> ())?
    var viewController : MyGiftsViewController?
    var navigationController: UINavigationController?
    var viewModel : MyGiftsViewModelProtocol
    var homeTabCoordinator: HomeTabCoordinator?

    
    init(viewModel: MyGiftsViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = MyGiftsViewController.instantiate(.myGifts)
//        self.viewController?.id = id
        self.viewController?.viewModel = viewModel
    }
}

extension MyGiftsCoordinator:MyGiftsViewModelCoordinatorDelegate{
}
