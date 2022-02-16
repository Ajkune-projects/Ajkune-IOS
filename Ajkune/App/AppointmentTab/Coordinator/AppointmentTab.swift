//
//  AppointmentTab.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

import Foundation
import UIKit

class AppointmentTabCoordinator: TDDefaultCoordinator{
    var viewController : AppointmentTabViewController?
    var viewModel : AppointmentTabViewModelProtocol
    
    init(viewModel: AppointmentTabViewModelProtocol = AppointmentTabViewModel()) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = AppointmentTabViewController.instantiate(.appointmentTab)
        self.viewController?.viewModel = self.viewModel
    }
}

extension AppointmentTabCoordinator: AppointmentTabViewModelCoordinatorDelegate{
}
