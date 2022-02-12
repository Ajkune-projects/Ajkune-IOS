//
//  ProfileViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import Foundation
protocol ProfileViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : ProfileViewModelCoordinatorDelegate? {get set}
    func showUserAddress()
    //API
    func getUserDetails(completion: @escaping ((Users?) -> Void))
    func verificationProfile(user:UserProfile?, completion: @escaping ((UserResponse?) -> Void))
}
