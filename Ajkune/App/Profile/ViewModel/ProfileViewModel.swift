//
//  ProfileViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import Foundation

class ProfileViewModel: ProfileViewModelProtocol{
    weak var coordinatorDelegate : ProfileViewModelCoordinatorDelegate?
    func showUserAddress(){
        self.coordinatorDelegate?.showUserAddress()
    }
    
    //API
    func getUserDetails(completion: @escaping ((Users?) -> Void)) {
        let user = AuthenticationClient.getUserDetails()
        user.execute(onSuccess: { user in
            completion(user)
         }, onFailure: {error in
            completion(nil)
         })
    }
    func verificationProfile(user: UserProfile?, completion: @escaping ((UserResponse?) -> Void)) {
        let user = AuthenticationClient.verificationProfile(user: user)
        user.execute(onSuccess: { user in
            completion(user)
         }, onFailure: {error in
            completion(nil)
         })
    }
    
    
}
