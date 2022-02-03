//
//  ForgotPasswordViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza Rrustemi
//

import Foundation
protocol ForgotPasswordViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : ForgotPasswordViewModelCoordinatorDelegate? {get set}
    
    func showforgotPasswordVerification()
    
    //API
    func requestForgotPassword(email: String, completion: @escaping ((ServerResponse?) -> Void))
}
