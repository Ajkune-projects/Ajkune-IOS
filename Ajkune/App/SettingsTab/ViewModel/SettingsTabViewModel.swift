//
//  SettingsViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import Foundation
class SettingsTabViewModel: SettingsTabViewModelProtocol{
    var coordinatorDelegate: SettingsTabViewModelCoordinatorDelegate?
    
    func showProfile() {
        coordinatorDelegate?.showProfile()
    }
    func showLanguage() {
        coordinatorDelegate?.showLanguage()
    }
    
    func showMyGifts() {
        coordinatorDelegate?.showMyGifts()
    }
    
    //API
    func deleteUser(completion: @escaping ((ServerResponse?) -> Void)) {
         let client = AuthenticationClient.deleteUser()
         client.execute(onSuccess: { response in
             completion(response)
         }, onFailure: {error in
             completion(nil)
         })
     }
}
