//
//  ResponseModelRegister.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 24.10.21..
//

import Foundation
struct RegsiterResponse: Decodable {
    let success: String
    let message: String
    let data: DataRegister
}

struct DataRegister: Decodable {
    let name : String
    let email: String
    let updated_at: String
    let created_at: String
    let id : Int
    let profile_photo_url: String?
}


