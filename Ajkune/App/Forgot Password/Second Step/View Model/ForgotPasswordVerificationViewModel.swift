//
//  ForgotPasswordVerificationViewModel.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//

import Foundation
class ForgotPasswordVerificationViewModel: ForgotPasswordVerificationViewModelProtocol {
    var email: String?
    weak var coordinatorDelegate: ForgotPasswordVerificationViewModelCoordinatorDelegate?
    func showResetPassword(){
        self.coordinatorDelegate?.showResetPassword()
    }
    
    //API
    func checkResetPasswordCode(resetPasswordCode: String, completion: @escaping ((ServerResponse?) -> Void)) {
        let client = TDAuthenticationClient.checkResetPasswordCode(resetPasswordCode: resetPasswordCode)
        client.execute(onSuccess: { response in
            completion(response)
        }, onFailure: {error in
            completion(nil)
        })
    }

}
