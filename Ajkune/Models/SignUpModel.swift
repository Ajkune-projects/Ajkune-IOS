//
//  SignUpModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/3/22.
//

import Foundation

struct UserSignUpModel: Codable{
        var name, email, password: String?
    }
struct ResetPasswordModel: Codable {
    var code, email, password, confirmation_password: String?
}
