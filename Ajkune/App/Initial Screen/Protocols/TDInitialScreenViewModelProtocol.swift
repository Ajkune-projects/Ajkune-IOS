//
//  TDInitialScreenViewModelProtocol.swift
//
//  Created by Djellza Rrustemi
//

import Foundation

protocol TDInitialScreenViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : TDInitialScreenViewModelCoordinatorDelegate? {get set}
    func showSignUp()
    func initializeLogin()
}
