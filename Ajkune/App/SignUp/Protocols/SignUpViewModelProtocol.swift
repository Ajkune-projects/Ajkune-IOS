//
//  SignUpViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza Rrustemi
//

protocol SignUpViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : SignUpViewModelCoordinatorDelegate? {get set}
    
    func showLogin()
    
    //API
    func requestSignUp(model: UserSignUpModel, completion: @escaping ((ServerResponse?) -> Void))

}
