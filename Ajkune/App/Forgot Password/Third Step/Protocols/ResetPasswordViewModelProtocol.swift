//
//  ResetPasswordViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza Rrustemi on 03.02.22.
//

import Foundation
protocol ResetPasswordViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : ResetPasswordViewModelCoordinatorDelegate? {get set}
    //API
    func requestResetPassword(data: ResetPasswordModel, completion: @escaping ((ServerResponse?) -> Void))
}
