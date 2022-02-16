//
//  AppointmentTabViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

protocol AppointmentTabViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : AppointmentTabViewModelCoordinatorDelegate? {get set}
}
