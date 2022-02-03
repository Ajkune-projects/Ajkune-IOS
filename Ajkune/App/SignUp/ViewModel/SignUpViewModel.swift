//
//  SignUpViewModel.swift
//  Ajkune
//
//  Created by Djellza Rrustemi
//

import UIKit

class SignUpViewModel: SignUpViewModelProtocol {
    weak var coordinatorDelegate: SignUpViewModelCoordinatorDelegate?
    
    func showLogin() {
        self.coordinatorDelegate?.showLogin()
    }
    func requestSignUp(model: UserSignUpModel, completion: @escaping ((ServerResponse?) -> Void)) {
        let login = TDAuthenticationClient.signUp(model: model)
        login.execute(onSuccess: { user in
            completion(user)
        }, onFailure: {error in
            completion(nil)
        })
    }
}
