//
//  ViewModel.swift
//
//
//  Created by Djellza Rrustemi
//

class LoginViewModel: LoginViewModelProtocol{
    func showForgotPassword() {
        coordinatorDelegate?.showForgotPassword()
    }
    
    weak var coordinatorDelegate : LoginViewModelCoordinatorDelegate?
    
    func showSignUp() {
        coordinatorDelegate?.showSignUp()
    }
    
    func loginSuccessful() {
        self.coordinatorDelegate?.loginSuccessful()
    }
    
    func requestLogin(email: String, password: String, completion: @escaping ((LoginResponse?) -> Void)) {
        let login = TDAuthenticationClient.login(email: email, password: password)
        login.execute(onSuccess: { user in
            completion(user)
         }, onFailure: {error in
            completion(nil)
         })
    }

}
