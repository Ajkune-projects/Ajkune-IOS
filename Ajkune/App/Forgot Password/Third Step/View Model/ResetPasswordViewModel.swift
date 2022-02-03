//
//  ResetPasswordViewModel.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//

import Foundation
class ResetPasswordViewModel: ResetPasswordViewModelProtocol {
    weak var coordinatorDelegate: ResetPasswordViewModelCoordinatorDelegate?
    
    func requestResetPassword(data: ResetPasswordModel, completion: @escaping ((ServerResponse?) -> Void)) {
        let client = TDAuthenticationClient.requestResetPassword(data: data)
        client.execute(onSuccess: { response in
            completion(response)
        }, onFailure: {error in
            completion(nil)
        })
    }
}
