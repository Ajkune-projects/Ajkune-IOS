//
//  ResponseLogin.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 24.10.21..
//

import Foundation


struct LoginResponse: Decodable {
    let success : Bool
    let token : String
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case token = "token"
    }
}
