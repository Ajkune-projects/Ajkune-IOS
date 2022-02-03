//
//  ForgotPasswordVerificationViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//

import Foundation
protocol ForgotPasswordVerificationViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : ForgotPasswordVerificationViewModelCoordinatorDelegate? {get set}
    
    var email: String? {get set}
    
    func showResetPassword()
    //API
    func checkResetPasswordCode(resetPasswordCode: String, completion: @escaping ((ServerResponse?) -> Void))
}
