//
//  LoginViewModelProtocol.swift

//
//  Created by Djellza Rrustemi
//

protocol LoginViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : LoginViewModelCoordinatorDelegate? {get set}
    
    func showSignUp()
    func loginSuccessful()
    func showForgotPassword()
    
    //API
    func requestLogin(email: String, password: String, completion: @escaping ((LoginResponse?) -> Void))

}
