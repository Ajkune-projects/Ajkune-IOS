//
//  ForgotPasswordViewModel.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//

import Foundation
class ForgotPasswordViewModel: ForgotPasswordViewModelProtocol {
    weak var coordinatorDelegate: ForgotPasswordViewModelCoordinatorDelegate?
    
    func showforgotPasswordVerification(){
        self.coordinatorDelegate?.showforgotPasswordVerification()
    }
    
    //API
    func requestForgotPassword(email: String, completion: @escaping ((ServerResponse?) -> Void)) {
        let client = AuthenticationClient.requestForgotPassword(email: email)
        client.execute(onSuccess: { response in
            completion(response)
        }, onFailure: {error in
            completion(nil)
        })
    }
}
